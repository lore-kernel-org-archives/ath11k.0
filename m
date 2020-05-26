Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdYwb-0000XB-KX
 for ath11k@lists.infradead.org; Tue, 26 May 2020 12:44:35 +0000
Message-ID: <d4e39180f0a8a8b07dc558c9439b66cd2c3aec07.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] mac80211: enable TKIP when using encapsulation
 offloading
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 26 May 2020 14:44:25 +0200
In-Reply-To: <1587720951-9222-2-git-send-email-murugana@codeaurora.org>
 (sfid-20200424_113624_468114_4CC488DE)
References: <1587720951-9222-1-git-send-email-murugana@codeaurora.org>
 <1587720951-9222-2-git-send-email-murugana@codeaurora.org>
 (sfid-20200424_113624_468114_4CC488DE)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Fri, 2020-04-24 at 15:05 +0530, Sathishkumar Muruganandam wrote:
> TKIP was disabled on encap offload mode since if TKIP MIC error
> reporting is not capable by the driver using encap offload mode,
> then TKIP countermeasures wont work.
> 
> Enabling back TKIP bring-up in encap offload mode to leave the
> control with the driver to disable hw encap when it is not capable
> of TKIP MIC error reporting.

So how can the driver do TKIP MIC error reporting?

I don't think it can. It doesn't have all the necessary information to
call cfg80211_michael_mic_failure(), as far as I can tell.

I'm not applying this until I see at least the *ability* for drivers to
do it. I mean, I don't really want to worry about your driver's
correctness, but if you then turn around and realize that you *cannot*
actually implement the right behaviour, that's no good either.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
