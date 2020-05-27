Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdx3C-0000wc-8M
 for ath11k@lists.infradead.org; Wed, 27 May 2020 14:28:59 +0000
Message-ID: <f26e82321f4df75041e3013eb8128ef60048f7fe.camel@sipsolutions.net>
Subject: Re: [PATCH v3 05/11] mac80211: fix memory overlap due to variable
 length param
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 27 May 2020 16:28:53 +0200
In-Reply-To: <1589399105-25472-5-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-5-git-send-email-rmanohar@codeaurora.org>
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

On Wed, 2020-05-13 at 12:44 -0700, Rajkumar Manoharan wrote:
> As of now HE operation element in bss_conf includes variable length
> optional field followed by other HE variable. Though the optional
> field never be used, actually it is referring to next member of the
> bss_conf structure which is not correct. Fix it by declaring needed
> HE operation fields within bss_conf itself.

I had already applied this.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
