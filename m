Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeeP6-0006QJ-Ak
 for ath11k@lists.infradead.org; Fri, 29 May 2020 12:46:29 +0000
Message-ID: <f2b8fb0783b270a177ee900168fdc1fbc9253e3d.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] mac80211: enable TKIP when using encapsulation
 offloading
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 29 May 2020 14:46:25 +0200
In-Reply-To: <4bab3197997bb2dd6555ff920c5dd1cb@codeaurora.org>
References: <1587720951-9222-1-git-send-email-murugana@codeaurora.org>
 <1587720951-9222-2-git-send-email-murugana@codeaurora.org>
 (sfid-20200424_113624_468114_4CC488DE)
 <d4e39180f0a8a8b07dc558c9439b66cd2c3aec07.camel@sipsolutions.net>
 <7fb606edf1e5c7ab5b1446d637768ee7@codeaurora.org>
 <aaa53c3a9cf6788cb653eb574073a1a0bcc5e6bf.camel@sipsolutions.net>
 <4bab3197997bb2dd6555ff920c5dd1cb@codeaurora.org>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Fri, 2020-05-29 at 17:59 +0530, Sathishkumar Muruganandam wrote:
> 
> Yes, currently only tx encap support is added and rx decap support is in
> progress to do TKIP MIC error reporting to userspace via 
> cfg80211_michael_mic_failure().

Yes, but can you actually call that? It requires a netdev. I don't think
you can easily get it from the vif?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
