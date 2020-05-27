Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je0sZ-0007SS-Nl
 for ath11k@lists.infradead.org; Wed, 27 May 2020 18:34:18 +0000
MIME-Version: 1.0
Date: Wed, 27 May 2020 11:34:10 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v3 10/11] mac80211: determine chantype from HE operation
 in 6 GHz
In-Reply-To: <6383af0eec17c942c20361d237c298f8a8ceaa54.camel@sipsolutions.net>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-10-git-send-email-rmanohar@codeaurora.org>
 <74232fe9a140a15306c04f0509e6c615b8e329de.camel@sipsolutions.net>
 (sfid-20200527_164156_614875_57253EF5)
 <6383af0eec17c942c20361d237c298f8a8ceaa54.camel@sipsolutions.net>
Message-ID: <61b5ee51619e8cc676e644bb25463d3b@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On 2020-05-27 07:44, Johannes Berg wrote:
> Oh, that was the last patch, ok.
> 
> So let's hear what you want to say regarding my comments - but please
> don't respin.
> 
> I will put some order into our patches tomorrow and post them, or
> perhaps better, post a combined series of yours and mine.
> 
> Sounds OK?
> 
Sounds great. There is one more followup patch I posted later. Sorry for 
that..
This is needed to propagate HE 6 GHz cap to user space.

https://patchwork.kernel.org/patch/11569921/

As you aware that the related hostapd series were submitted.

http://patchwork.ozlabs.org/project/hostap/list/?series=179527

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
