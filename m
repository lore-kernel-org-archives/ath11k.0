Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
References: <20201107172152.828-1-ap420073@gmail.com>
 <20201107110522.2a796f1d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201107110522.2a796f1d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Sun, 8 Nov 2020 04:52:55 +0900
Message-ID: <CAMArcTXNMpjEnVA8sz82CTTnCofqEK+hUSSq27mvjqV6QCiAOQ@mail.gmail.com>
Subject: Re: [PATCH net v2 00/21] net: avoid to remove module when its debugfs
 is being used
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: alex.aring@gmail.com, emmanuel.grumbach@intel.com, chi-hsien.lin@infineon.com, amitkarwar@gmail.com, ganapathi.bhat@nxp.com, Luciano Coelho <luciano.coelho@intel.com>, ath10k@lists.infradead.org, wcn36xx@lists.infradead.org, stefan@datenfreihafen.org, merez@codeaurora.org, stf_xl@wp.pl, pkshih@realtek.com, Nicolai Stange <nstange@suse.de>, chung-hsien.hsu@infineon.com, wright.feng@infineon.com, inaky.perez-gonzalez@intel.com, derosier@gmail.com, David Laight <David.Laight@aculab.com>, b43-dev@lists.infradead.org, ath11k@lists.infradead.org, Arend Van Spriel <arend.vanspriel@broadcom.com>, johan.hedberg@gmail.com, michael.hennerich@analog.com, marcel@holtmann.org, hante.meuleman@broadcom.com, linux-wimax@intel.com, jukka.rissanen@linux.intel.com, Kalle Valo <kvalo@codeaurora.org>, franky.lin@broadcom.com, huxinming820@gmail.com, Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, linux-bluetooth@vger.kernel.org, wil6210@qti.qualcomm.com, Johannes Berg <johannes@sipsolutions.net>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wpan@vger.kernel.org, David Miller <davem@davemloft.net>, pizza@shaftnet.org

On Sun, 8 Nov 2020 at 04:05, Jakub Kicinski <kuba@kernel.org> wrote:
>

Hi Jakub,
Thank you for the review!

> On Sat,  7 Nov 2020 17:21:31 +0000 Taehee Yoo wrote:
> > When debugfs file is opened, its module should not be removed until
> > it's closed.
> > Because debugfs internally uses the module's data.
> > So, it could access freed memory.
> >
> > In order to avoid panic, it just sets .owner to THIS_MODULE.
> > So that all modules will be held when its debugfs file is opened.
>
> Hm, looks like some of the patches need to be revised because
> .owner is already set in the ops, and a warning gets generated.

Thanks, I found my mistake via patchwork.
I will fix this problem.

>
> Also it'd be good to mention why Johannes's approach was abandoned.

I'm sorry about skipping the explanation of the situation,
Johannes sent RFC[1], which fixes this problem in the debugfs core logic.
I tested it and it actually avoids this problem well.
And I think there would be more discussion.
So, I thought this series' approach is reasonable right now.
I think setting .owner to THIS_MODULE is a common behavior and it
doesn't hurt our logic even if Johannes's approach is merged.
I'm expecting that both approaches of this series and Johannes are
doing separately.

[1] https://www.spinics.net/lists/linux-wireless/msg204171.html

>
> When you repost please separate out all the patches for
> drivers/net/wireless/ and send that to Kalle's wireless drivers tree.
> Patch 1 needs to be split in two. Patches 2 and 3 would go via Johannes.
> The wimax patch needs to go to staging (wimax code has been moved).
> The remaining patches can be posted individually, not as a series.

Okay, I will do this.

Thanks a lot!
Taehee Yoo

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
