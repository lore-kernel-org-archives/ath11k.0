Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeF2n-0000mg-Ti
 for ath11k@lists.infradead.org; Thu, 28 May 2020 09:41:47 +0000
Message-ID: <650d683aeabd94a69bad64ae2a0af45c2fe25cd1.camel@sipsolutions.net>
Subject: Re: [PATCH v3 10/11] mac80211: determine chantype from HE operation
 in 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 May 2020 11:41:40 +0200
In-Reply-To: <74232fe9a140a15306c04f0509e6c615b8e329de.camel@sipsolutions.net>
 (sfid-20200527_164156_614875_57253EF5)
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-10-git-send-email-rmanohar@codeaurora.org>
 <74232fe9a140a15306c04f0509e6c615b8e329de.camel@sipsolutions.net>
 (sfid-20200527_164156_614875_57253EF5)
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

On Wed, 2020-05-27 at 16:41 +0200, Johannes Berg wrote:
> 
> Hmm. Yes, we just had
> 
> +       case IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH_160MHZ:
> +               if (abs(he_6ghz_oper->ccfs1 - he_6ghz_oper->ccfs0) == 8)
> +                       he_chandef.width = NL80211_CHAN_WIDTH_160;
> +               else
> +                       he_chandef.width = NL80211_CHAN_WIDTH_80P80;
> +               break;
> 
> 
> but that breaks if you don't support 80+80 or 160.
> 
> OTOH, we check this later again, I think, and downgrade if we don't
> support it, so no harm done?
> 
> I think I'd prefer the parsing to be exact, and then downgrade as
> necessary. That makes things a bit simpler.

Except that won't work for mesh.

I actually kinda like this better than what I did, because what I did
required all kinds of contortions with DISABLE_HT/VHT/HE ...

Still checking.

johannes



_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
