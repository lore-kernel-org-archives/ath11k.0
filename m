Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0110.hostedemail.com ([216.40.44.110]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0D5V-0005vj-OU
 for ath11k@lists.infradead.org; Tue, 28 Jul 2020 00:03:22 +0000
Message-ID: <940c318b59c3c3e945c80216699299d051f8b4c5.camel@perches.com>
Subject: Re: [PATCH][next] ath11k: Use fallthrough pseudo-keyword
From: Joe Perches <joe@perches.com>
Date: Mon, 27 Jul 2020 17:03:16 -0700
In-Reply-To: <CAGRGNgW4VB1F9TdHf1Kg6WQtgHyH-ZKAnZ0kU5eKQaqUWHwbqg@mail.gmail.com>
References: <20200727194415.GA1275@embeddedor>
 <70ed74d65b5909615c7a9430f3479695465d3b1d.camel@perches.com>
 <CAGRGNgW4VB1F9TdHf1Kg6WQtgHyH-ZKAnZ0kU5eKQaqUWHwbqg@mail.gmail.com>
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
To: Julian Calaby <julian.calaby@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Tue, 2020-07-28 at 09:44 +1000, Julian Calaby wrote:
> Hi Joe,
> 
> On Tue, Jul 28, 2020 at 5:48 AM Joe Perches <joe@perches.com> wrote:
> > On Mon, 2020-07-27 at 14:44 -0500, Gustavo A. R. Silva wrote:
> > > Replace the existing /* fall through */ comments and its variants with
> > > the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> > > fall-through markings when it is the case.
> > []
> > > diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> > []
> > > @@ -159,7 +159,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
> > >                       break;
> > >               }
> > >               /* follow through when ring_num >= 3 */
> > > -             /* fall through */
> > > +             fallthrough;
> > 
> > Likely the /* follow through ... */ comment can be deleted too
> 
> If the "when ring_num >= 3" comment is needed, how should this get
> formatted? Maybe something like:
> 
> fallthrough; /* when ring_num >= 3 */

Likely, or just removed as the test above is fairly clear

Existing code:

	case HAL_WBM2SW_RELEASE:
		if (ring_num < 3) {
			params.intr_batch_cntr_thres_entries =
					HAL_SRNG_INT_BATCH_THRESHOLD_TX;
			params.intr_timer_thres_us =
					HAL_SRNG_INT_TIMER_THRESHOLD_TX;
			break;
		}
		/* follow through when ring_num >= 3 */
		/* fall through */
	case HAL_REO_EXCEPTION:



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
