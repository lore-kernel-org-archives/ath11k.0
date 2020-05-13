Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYyqR-0005DM-3O
 for ath11k@lists.infradead.org; Wed, 13 May 2020 21:23:19 +0000
MIME-Version: 1.0
Date: Wed, 13 May 2020 14:22:58 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH] ath11k: Fix some resource leaks in error path in
 'ath11k_thermal_register()'
In-Reply-To: <20200513201454.258111-1-christophe.jaillet@wanadoo.fr>
References: <20200513201454.258111-1-christophe.jaillet@wanadoo.fr>
Message-ID: <8ee716c797a547165132c179c1909404@codeaurora.org>
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
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, pradeepc@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, linux-wireless-owner@vger.kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On 2020-05-13 13:14, Christophe JAILLET wrote:
> If 'thermal_cooling_device_register()' fails, we must undo what has 
> been
> allocated so far. So we must go to 'err_thermal_destroy' instead of
> returning directly
> 
> In case of error in 'ath11k_thermal_register()', the previous
> 'thermal_cooling_device_register()' call must also be undone. Move the
> 'ar->thermal.cdev = cdev' a few lines above in order for this to be 
> done
> in 'ath11k_thermal_unregister()' which is called in the error handling
> path.
> 
> Fixes: 2a63bbca06b2 ("ath11k: add thermal cooling device support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I'm not 100% confident with this patch.
> 
> - When calling 'ath11k_thermal_unregister()', we try to release some
>   resources that have not been allocated yet. I don't know if it can be 
> an
>   issue or not.
> - I think that we should propagate the error code, instead of forcing
>   -EINVAL.
> 
Good catch.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
