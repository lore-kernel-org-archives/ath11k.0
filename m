Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5X5w-0004bk-FP
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 15:21:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/4] ath11k: add HE support
References: <20190904091211.26868-1-john@phrozen.org>
 <20190904091211.26868-2-john@phrozen.org>
Date: Wed, 04 Sep 2019 18:21:12 +0300
In-Reply-To: <20190904091211.26868-2-john@phrozen.org> (John Crispin's message
 of "Wed, 4 Sep 2019 11:12:08 +0200")
Message-ID: <87r24wnl3r.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> Add basic HE support to the driver. The sband_iftype data is generated from
> the capabilities read from the FW.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

[...]

> +		for (nss = 0; nss <= arg->peer_ppet.numss_m1; nss++) {
> +			for (ru = 0; ru < 4; ru++) {
> +				u32 val = 0;
> +				int i;
> +
> +				if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
> +					continue;
> +				for (i = 0; i < 6; i++) {
> +					val >>= 1;
> +					val |= ((he_cap->ppe_thres[bit / 8] >>
> +						 (bit % 8)) & 0x1) << 5;
> +					bit++;
> +				}
> +				arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=
> +								val << (ru * 6);
> +			}
> +		}
> +	}

I think this loop needs a code comment explaining what's happening here.


[...]

> +static void ath11k_gen_ppe_thresh(struct ath11k_ppe_threshold *fw_ppet,
> +				  u8 *he_ppet)
> +{
> +	int nss, ru;
> +	u8 bit = 7;
> +
> +	he_ppet[0] = fw_ppet->numss_m1 & IEEE80211_PPE_THRES_NSS_MASK;
> +	he_ppet[0] |= (fw_ppet->ru_bit_mask <<
> +		       IEEE80211_PPE_THRES_RU_INDEX_BITMASK_POS) &
> +		      IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK;
> +	for (nss = 0; nss <= fw_ppet->numss_m1; nss++) {
> +		for (ru = 0; ru < 4; ru++) {
> +			u8 val;
> +			int i;
> +
> +			if ((fw_ppet->ru_bit_mask & BIT(ru)) == 0)
> +				continue;
> +			val = (fw_ppet->ppet16_ppet8_ru3_ru0[nss] >> (ru * 6)) &
> +			       0x3f;
> +			val = ((val >> 3) & 0x7) | ((val & 0x7) << 3);
> +			for (i = 5; i >= 0; i--) {
> +				he_ppet[bit / 8] |=
> +					((val >> i) & 0x1) << ((bit % 8));
> +				bit++;
> +			}
> +		}
> +	}

And this as well.

> +		he_cap->he_mcs_nss_supp.rx_mcs_80 =
> +			cpu_to_le16(band_cap->he_mcs & 0xffff);
> +		he_cap->he_mcs_nss_supp.tx_mcs_80 =
> +			cpu_to_le16(band_cap->he_mcs & 0xffff);
> +		he_cap->he_mcs_nss_supp.rx_mcs_160 =
> +			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
> +		he_cap->he_mcs_nss_supp.tx_mcs_160 =
> +			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
> +		he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
> +			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
> +		he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
> +			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);

We try always have proper defines for the magic values and using
FIELD_GET() instead of manually shifting.


-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
