Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izczE-000880-Ht
 for ath11k@lists.infradead.org; Thu, 06 Feb 2020 08:58:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id m16so6092611wrx.11
 for <ath11k@lists.infradead.org>; Thu, 06 Feb 2020 00:58:11 -0800 (PST)
Subject: Re: [PATCH V2 1/3] nl80211: add support for setting fixed HE
 rate/gi/ltf
References: <20200204103514.18111-1-john@phrozen.org>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <4bf4c267-bfc2-1a04-f2d6-541f086e72c0@broadcom.com>
Date: Thu, 6 Feb 2020 09:58:08 +0100
MIME-Version: 1.0
In-Reply-To: <20200204103514.18111-1-john@phrozen.org>
Content-Language: en-US
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
To: John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2/4/2020 11:35 AM, John Crispin wrote:
> From: Miles Hu <milehu@codeaurora.org>
> 
> This patch adds the nl80211 structs, definitions, policies and parsing
> code required to pass fixed HE rate, gi and ltf settings.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> ---
> Changes in V2
> * add more policies
> * reoder enums
> * remove incorrect he_cap from ieee80211_supported_band

Not seeing the change listed above or am I missing something?

Regards,
Arend

> * remove _WARN from policy
> 
>   include/net/cfg80211.h       |   3 +
>   include/uapi/linux/nl80211.h |  28 +++++++++
>   net/wireless/nl80211.c       | 117 ++++++++++++++++++++++++++++++++++-
>   3 files changed, 146 insertions(+), 2 deletions(-)

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
