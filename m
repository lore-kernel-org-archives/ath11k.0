Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k170B-0001KH-9V
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 11:45:37 +0000
Message-ID: <9271c24316853ac90dd466357ad5845dcc9891c9.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] nl80211: vendor-cmd: qca: add command for ap power
 save
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 13:45:19 +0200
In-Reply-To: <1589954745-12870-1-git-send-email-vnaralas@codeaurora.org>
 (sfid-20200520_080604_936685_6A1D30A3)
References: <1589954745-12870-1-git-send-email-vnaralas@codeaurora.org>
 (sfid-20200520_080604_936685_6A1D30A3)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Wed, 2020-05-20 at 11:35 +0530, Venkateswara Naralasetty wrote:
> This patch is to add vendor command support to enable/disable
> ap power save.
> 
> An example of usage: iw dev wlanx vendor send 0x1374 0x4a ap-ps <val>
> 
> 0x1374: vendor id
> 0x4a: vendor subcmd id
> val: 0 - disable power save
>      1 - enable power save

This really doesn't pass the bar ...

https://wireless.wiki.kernel.org/en/developers/documentation/nl80211#vendor-specific_api

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
