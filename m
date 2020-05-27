Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdx4b-0003oS-Dg
 for ath11k@lists.infradead.org; Wed, 27 May 2020 14:30:26 +0000
Message-ID: <db25e743c1d71fb97af71c9aee2fec8a3c34ecd1.camel@sipsolutions.net>
Subject: Re: [PATCH v3 08/11] mac80211: build HE operation with 6 GHz oper
 information
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 27 May 2020 16:30:19 +0200
In-Reply-To: <1589399105-25472-8-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-8-git-send-email-rmanohar@codeaurora.org>
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

On Wed, 2020-05-13 at 12:45 -0700, Rajkumar Manoharan wrote:
> Add 6 GHz operation information (IEEE 802.11ax/D6.0, Figure 9-787k)
> while building HE operation element for non-HE AP. This field is used to
> determine channel information in the absence of HT/VHT IEs.

We didn't have this at all since we focused on client side.

Looks good.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
