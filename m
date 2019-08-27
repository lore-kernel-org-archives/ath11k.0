Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Z4f-0006zV-HZ
 for ath11k@lists.infradead.org; Tue, 27 Aug 2019 10:51:42 +0000
MIME-Version: 1.0
Date: Tue, 27 Aug 2019 16:21:40 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
In-Reply-To: <c37a9fc4-aa74-a333-a67c-cce66ad78ec0@green-communications.fr>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <c37a9fc4-aa74-a333-a67c-cce66ad78ec0@green-communications.fr>
Message-ID: <1da054e86da63423a5e58c22c2c79d79@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: linux-wireless-owner@vger.kernel.org, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-08-23 20:32, Nicolas Cavallari wrote:
> On 20/08/2019 17:47, Kalle Valo wrote:
>> +	ar->hw->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
>> +					 BIT(NL80211_IFTYPE_AP) |
>> +					 BIT(NL80211_IFTYPE_MESH_POINT);
> 
> [...]
> 
>> +	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
> 
> so IBSS-RSN is supported without IBSS support ?

Sure. IBSS-RSN is not relevant when IBSS is not supported, I guess.
We'll take care of this. Thanks.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
