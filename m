Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
References: <20201107172152.828-1-ap420073@gmail.com>
 <20201107172152.828-18-ap420073@gmail.com>
 <175a3cc2738.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <175a3cc2738.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Sun, 8 Nov 2020 03:16:37 +0900
Message-ID: <CAMArcTVgw3hN=ffb88hYrOy5jD1W+V1XKDtd_Rs2mkoOSGj5Vw@mail.gmail.com>
Subject: Re: [PATCH net v2 17/21] brcmfmac: set .owner to THIS_MODULE
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
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: alex.aring@gmail.com, emmanuel.grumbach@intel.com, chi-hsien.lin@infineon.com, amitkarwar@gmail.com, ganapathi.bhat@nxp.com, Luciano Coelho <luciano.coelho@intel.com>, ath10k@lists.infradead.org, wcn36xx@lists.infradead.org, stefan@datenfreihafen.org, merez@codeaurora.org, stf_xl@wp.pl, pkshih@realtek.com, Nicolai Stange <nstange@suse.de>, chung-hsien.hsu@infineon.com, wright.feng@infineon.com, inaky.perez-gonzalez@intel.com, derosier@gmail.com, David Laight <David.Laight@aculab.com>, b43-dev@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, johan.hedberg@gmail.com, michael.hennerich@analog.com, marcel@holtmann.org, hante.meuleman@broadcom.com, linux-wimax@intel.com, jukka.rissanen@linux.intel.com, Kalle Valo <kvalo@codeaurora.org>, franky.lin@broadcom.com, huxinming820@gmail.com, Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, linux-bluetooth@vger.kernel.org, wil6210@qti.qualcomm.com, Johannes Berg <johannes@sipsolutions.net>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wpan@vger.kernel.org, David Miller <davem@davemloft.net>, pizza@shaftnet.org

On Sun, 8 Nov 2020 at 02:41, Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>

Hi Arend,
Thank you for the review!

> On November 7, 2020 6:25:15 PM Taehee Yoo <ap420073@gmail.com> wrote:
>
> > If THIS_MODULE is not set, the module would be removed while debugfs is
> > being used.
> > It eventually makes kernel panic.
>
> Is this really a valid concern in the context of debugs? I tend to say it
> is not. Whenever I am using debugs to debug my driver I make sure to avoid
> removing it.

I think getting rid of every scenario of the kernel panic is the
first priority thing.
So I'm sure that trying to avoid kernel panic is always valid even
in the debugging context.

Thanks a lot!
Taehee Yoo

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
