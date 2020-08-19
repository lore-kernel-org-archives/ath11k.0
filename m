Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8RyH-00019w-HP
 for ath11k@lists.infradead.org; Wed, 19 Aug 2020 17:33:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V6 2/2] ath11k: add more HE fields into radiotap header
References: <20200803145444.473810-1-john@phrozen.org>
 <20200803145444.473810-2-john@phrozen.org>
Date: Wed, 19 Aug 2020 20:33:44 +0300
In-Reply-To: <20200803145444.473810-2-john@phrozen.org> (John Crispin's
 message of "Mon, 3 Aug 2020 16:54:44 +0200")
Message-ID: <87h7syilqf.fsf@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> From: Miles Hu <milehu@codeaurora.org>
>
> This patch adds code to parse HE fields inside ppdu TLVs. Then it adds the
> populates the additional info into the ratiotap header. Also fix missing
> QoS tag in native wifi mode. Finally rssi and tsf are also added.
>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>

On what hardware and firmware was this tested?

I did quite a few cosmetic changes in the pending branch.

> +		value = FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_BSS_COLOR, info0);
> +		ppdu_info->he_data3 = value;
> +		value = FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_BEAM_CHANGE, info0);
> +		value = value << HE_BEAM_CHANGE_SHIFT;

[...]

> +#define HAL_RX_HE_SIG_A_SU_INFO_INFO0_BEAM_CHANGE	BIT(1)
> +#define HE_BEAM_CHANGE_SHIFT 6

There's a lot of these shifts which I don't understand. Why not fix the
actual defines so that FIELD_GET() works correctly and no manual
shifting is needed? In this example from BIT(1) to BIT(7).

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
