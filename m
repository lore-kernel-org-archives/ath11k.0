Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPi6R-00065o-UH
 for ath11k@lists.infradead.org; Tue, 06 Oct 2020 08:13:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id j2so12371068wrx.7
 for <ath11k@lists.infradead.org>; Tue, 06 Oct 2020 01:13:42 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Date: Tue, 6 Oct 2020 09:13:21 +0100
Subject: Re: [PATCH 2/2] ath11k: Handle errors if peer creation fails
Message-ID: <20201006081321.e2tf5xrdhnk4j3nq@medion>
References: <20201004100218.311653-1-alex.dewar90@gmail.com>
 <87blhfbysb.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87blhfbysb.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, ath11k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Alex Dewar <alex.dewar90@gmail.com>

On Tue, Oct 06, 2020 at 10:26:28AM +0300, Kalle Valo wrote:
> Alex Dewar <alex.dewar90@gmail.com> writes:
> 
> > ath11k_peer_create() is called without its return value being checked,
> > meaning errors will be unhandled. Add missing check and, as the mutex is
> > unconditionally unlocked on leaving this function, simplify the exit
> > path.
> >
> > Addresses-Coverity-ID: 1497531 ("Code maintainability issues")
> > Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
> > Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++------------
> >  1 file changed, 9 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> > index 7f8dd47d2333..58db1b57b941 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -5211,7 +5211,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
> >  	struct ath11k *ar = hw->priv;
> >  	struct ath11k_base *ab = ar->ab;
> >  	struct ath11k_vif *arvif = (void *)vif->drv_priv;
> > -	int ret;
> > +	int ret = 0;
> 
> I prefer not to initialise the ret variable.
> 
> >  	arvif->is_started = true;
> >  
> >  	/* TODO: Setup ps and cts/rts protection */
> >  
> > -	mutex_unlock(&ar->conf_mutex);
> > -
> > -	return 0;
> > -
> > -err:
> > +unlock:
> >  	mutex_unlock(&ar->conf_mutex);
> >  
> >  	return ret;
> 
> So in the pending branch I changed this to:
> 
> 	ret = 0;
> 
> out:
> 	mutex_unlock(&ar->conf_mutex);
> 
> 	return ret;
> 
> Please check.

Hi Kalle,

I'm afraid you've introduced a bug ;). The body of the first if-statement
in the function doesn't set ret because no error has occurred. So now
it'll jump to the label and the function will return ret uninitialized.

With the gcc extension, ret will be initialised to zero anyway, so we're
not saving anything by explicitly assigning to ret later in the
function.

Best,
Alex

> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
