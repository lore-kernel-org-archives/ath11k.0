Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKPgY-0006Pz-8h
 for ath11k@lists.infradead.org; Tue, 15 Oct 2019 16:28:35 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <1635460.phzPRRphLd@bentobox>
Date: Tue, 15 Oct 2019 19:28:27 +0300
In-Reply-To: <1635460.phzPRRphLd@bentobox> (Sven Eckelmann's message of "Wed, 
 21 Aug 2019 08:16:27 +0200")
Message-ID: <87d0eym0r8.fsf@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> On Tuesday, 20 August 2019 17:47:57 CEST Kalle Valo wrote:
>> +static void ath11k_peer_assoc_h_rates(struct ath11k *ar,
>> +                                     struct ieee80211_vif *vif,
>> +                                     struct ieee80211_sta *sta,
>> +                                     struct peer_assoc_params *arg)
>> +{
>> +       struct ath11k_vif *arvif = (void *)vif->drv_priv;
>> +       struct wmi_rate_set_arg *rateset = &arg->peer_legacy_rates;
>> +       struct cfg80211_chan_def def;
>> +       const struct ieee80211_supported_band *sband;
>> +       const struct ieee80211_rate *rates;
>> +       enum nl80211_band band;
>> +       u32 ratemask;
>> +       u8 rate;
>
> rate has to be u32 [1].
>
> Kind regards,
> 	Sven
>
> [1] https://patchwork.kernel.org/patch/11089507/

I have applied this now.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
