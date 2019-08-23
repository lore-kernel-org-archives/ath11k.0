Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1B5j-0008VO-OJ
 for ath11k@lists.infradead.org; Fri, 23 Aug 2019 15:03:05 +0000
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
Message-ID: <c37a9fc4-aa74-a333-a67c-cce66ad78ec0@green-communications.fr>
Date: Fri, 23 Aug 2019 17:02:53 +0200
MIME-Version: 1.0
In-Reply-To: <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
Content-Language: fr
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
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

On 20/08/2019 17:47, Kalle Valo wrote:
> +	ar->hw->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +					 BIT(NL80211_IFTYPE_AP) |
> +					 BIT(NL80211_IFTYPE_MESH_POINT);

[...]

> +	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;

so IBSS-RSN is supported without IBSS support ?

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
