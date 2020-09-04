Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEAGY-0002iE-Vl
 for ath11k@lists.infradead.org; Fri, 04 Sep 2020 11:52:27 +0000
MIME-Version: 1.0
Date: Fri, 4 Sep 2020 11:52:23 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2 24/24] nl80211/cfg80211: support 6 GHz scanning
In-Reply-To: <20200528213443.1b4cb4ffc82b.I9d94ae093e08fb15b6c8f8fb7406b316778c6a5f@changeid>
References: <20200528213443.993f108e96ca.I0086ae42d672379380d04ac5effb2f3d5135731b@changeid>
 <20200528213443.1b4cb4ffc82b.I9d94ae093e08fb15b6c8f8fb7406b316778c6a5f@changeid>
Message-ID: <0101017458f5e1ad-cbcf87ea-c118-4e1f-9c68-5631f0093ac5-000000@us-west-2.amazonses.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Tova Mussai <tova.mussai@intel.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, linux-wireless-owner@vger.kernel.org, ath11k@lists.infradead.org

On 2020-05-29 03:34, Johannes Berg wrote:
> From: Tova Mussai <tova.mussai@intel.com>
> 
> Support 6 GHz scanning, by
>  * a new scan flag to scan for colocated BSSes advertised
>    by (and found) APs on 2.4 & 5 GHz
>  * doing the necessary reduced neighbor report parsing for
>    this, to find them
>  * adding the ability to split the scan request in case the
>    device by itself cannot support this.
> 
> Also add some necessary bits in mac80211 to not break with
> these changes.
> 
> Signed-off-by: Tova Mussai <tova.mussai@intel.com>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>  include/net/cfg80211.h       |  29 ++-
>  include/uapi/linux/nl80211.h |   3 +
>  net/mac80211/scan.c          |   9 +-
>  net/wireless/core.c          |   4 +-
>  net/wireless/core.h          |   5 +-
>  net/wireless/nl80211.c       |  11 +-
>  net/wireless/scan.c          | 482 ++++++++++++++++++++++++++++++++++-
>  7 files changed, 527 insertions(+), 16 deletions(-)
...
Is this patch have interface for application such as iw, wpa_supplicant?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
