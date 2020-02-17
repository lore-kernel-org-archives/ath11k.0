Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3gVA-00089G-7l
 for ath11k@lists.infradead.org; Mon, 17 Feb 2020 13:31:58 +0000
Subject: Re: [RFC 0/2] add 802.11 decapsulation offload support
References: <1581942277-585-1-git-send-email-mpubbise@codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <eb504840-dd76-5278-e2ac-973548f31ba0@phrozen.org>
Date: Mon, 17 Feb 2020 14:31:51 +0100
MIME-Version: 1.0
In-Reply-To: <1581942277-585-1-git-send-email-mpubbise@codeaurora.org>
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 17/02/2020 13:24, Manikanta Pubbisetty wrote:
> Adding support for offloading 802.11 decapsulation to the HW.
> This reduces the CPU cycles spent on host CPU for doing the
> conversion from 802.11 format to ethernet format and thereby
> improving the performance of the device.
> 
> Note:
> Ath11k patch in this patchset depends on PN offload series
> and the multi reo patchset with the following name.
> "Support hash based reo destination ring selection"
> 

Hi,
you need to also Cc: this to linux-wireless
	John


> Manikanta Pubbisetty (2):
>    mac80211: add receive path for ethernet frame format
>    ath11k: add rx hw 802.11 decapsulation offloading support
> 
>   drivers/net/wireless/ath/ath11k/core.c     |   4 +
>   drivers/net/wireless/ath/ath11k/core.h     |   3 +
>   drivers/net/wireless/ath/ath11k/dp_rx.c    | 184 ++++++++++++++----------
>   drivers/net/wireless/ath/ath11k/hal_desc.h |   2 +
>   drivers/net/wireless/ath/ath11k/mac.c      |  21 +++
>   include/net/mac80211.h                     |  20 +++
>   net/mac80211/rx.c                          | 215 ++++++++++++++++++++++++++++-
>   7 files changed, 370 insertions(+), 79 deletions(-)
> 


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
