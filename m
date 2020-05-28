Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeF4y-00019z-6d
 for ath11k@lists.infradead.org; Thu, 28 May 2020 09:44:01 +0000
Message-ID: <1e313010dd85af086dc0922a3faeaa0e1c6cc44f.camel@sipsolutions.net>
Subject: Re: [PATCH v3 06/11] mac80211: handle HE 6 GHz Capability in HE STA
 processing
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 May 2020 11:43:55 +0200
In-Reply-To: <1589399105-25472-6-git-send-email-rmanohar@codeaurora.org>
 (sfid-20200513_214550_120836_C3C5E2B4)
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-6-git-send-email-rmanohar@codeaurora.org>
 (sfid-20200513_214550_120836_C3C5E2B4)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

So I'm dropping this one for now.

I'm going to send a series right now with what I have, and you can start
looking at how to put this on top.

I'd prefer for *mac80211* to add the 6ghz capa sub-struct to the station
and use that while parsing, I think that should still be reasonable from
the driver's POV. You'll see I didn't change ieee80211_sta_he_cap, and I
am thinking now that it shouldn't change.

I'm still working on
 * the HE oper -> channel parsing (MLME, and you also had mesh)
 * 6 GHz scan bits that we had.

But I think you should be able to work on this patch without those two
things.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
