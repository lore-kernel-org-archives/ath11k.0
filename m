Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdxH0-0002TO-J8
 for ath11k@lists.infradead.org; Wed, 27 May 2020 14:43:15 +0000
Message-ID: <0923c23ea6157a140eee855beaff436ea69e6e1f.camel@sipsolutions.net>
Subject: Re: [PATCH v3 06/11] mac80211: handle HE 6 GHz Capability in HE STA
 processing
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 27 May 2020 16:43:10 +0200
In-Reply-To: <1589399105-25472-6-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-6-git-send-email-rmanohar@codeaurora.org>
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
> During association or mesh peering of HE STA in 6 GHz band, required
> HT/VHT information has to be processed from 6 GHz band capabilities
> as HT/VHT IEs are not allowed in 6 GHz.
> 
>   * @has_he: true iff HE data is valid.
> + * @has_he_6ghz: true iff HE 6 GHz data is valid.

I guess here things start compiling ;-)

But like I said before, I'm not sure why this is needed?

Surely if the STA connected on 6 GHz it has capability ...

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
