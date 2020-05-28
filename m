Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDBm-00017x-E2
 for ath11k@lists.infradead.org; Thu, 28 May 2020 07:42:56 +0000
Message-ID: <af656620aee6768414fbef63beddf5f04851e5e8.camel@sipsolutions.net>
Subject: Re: [PATCH v3 01/11] cfg80211: use only HE capability to set
 prohibited flags in 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 May 2020 09:42:51 +0200
In-Reply-To: <6a606d4e32d6eb00b33f5ce8ad44a71994640c7d.camel@sipsolutions.net>
 (sfid-20200528_094155_221294_8CFB7C6D)
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <7f2a2a382c42b7285b9ad1eeac4e8060bc8d897a.camel@sipsolutions.net>
 <0fa1c07811796add4a6a23c81cbafe41@codeaurora.org>
 <6a606d4e32d6eb00b33f5ce8ad44a71994640c7d.camel@sipsolutions.net>
 (sfid-20200528_094155_221294_8CFB7C6D)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Vamsi Krishna <vamsin@codeaurora.org>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

Hello brain, meet fingers, they're a bit slower ...

> > > 
> > IIUC the same bits are applicable for both 5 GHz & 6 GHz. I understand 
> > the macro doesn't capture both.
> 
> Yeah, I think you're right. I looked at D6.0 (though there seems to be
> D6.1?) but I couldn't quite 

... couldn't fully understand it in the limited time I had left
yesterday :)

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
