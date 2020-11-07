Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Sat, 7 Nov 2020 11:05:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v2 00/21] net: avoid to remove module when its
 debugfs is being used
Message-ID: <20201107110522.2a796f1d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201107172152.828-1-ap420073@gmail.com>
References: <20201107172152.828-1-ap420073@gmail.com>
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
To: Taehee Yoo <ap420073@gmail.com>
Cc: alex.aring@gmail.com, emmanuel.grumbach@intel.com, chi-hsien.lin@infineon.com, amitkarwar@gmail.com, ganapathi.bhat@nxp.com, luciano.coelho@intel.com, ath10k@lists.infradead.org, wcn36xx@lists.infradead.org, stefan@datenfreihafen.org, merez@codeaurora.org, stf_xl@wp.pl, pkshih@realtek.com, nstange@suse.de, chung-hsien.hsu@infineon.com, wright.feng@infineon.com, inaky.perez-gonzalez@intel.com, derosier@gmail.com, David.Laight@aculab.com, b43-dev@lists.infradead.org, ath11k@lists.infradead.org, arend.vanspriel@broadcom.com, johan.hedberg@gmail.com, michael.hennerich@analog.com, marcel@holtmann.org, hante.meuleman@broadcom.com, linux-wimax@intel.com, jukka.rissanen@linux.intel.com, kvalo@codeaurora.org, franky.lin@broadcom.com, huxinming820@gmail.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-bluetooth@vger.kernel.org, wil6210@qti.qualcomm.com, johannes@sipsolutions.net, Larry.Finger@lwfinger.net, linux-wpan@vger.kernel.org, davem@davemloft.net, pizza@shaftnet.org

On Sat,  7 Nov 2020 17:21:31 +0000 Taehee Yoo wrote:
> When debugfs file is opened, its module should not be removed until
> it's closed.
> Because debugfs internally uses the module's data.
> So, it could access freed memory.
> 
> In order to avoid panic, it just sets .owner to THIS_MODULE.
> So that all modules will be held when its debugfs file is opened.

Hm, looks like some of the patches need to be revised because
.owner is already set in the ops, and a warning gets generated.

Also it'd be good to mention why Johannes's approach was abandoned.

When you repost please separate out all the patches for
drivers/net/wireless/ and send that to Kalle's wireless drivers tree.
Patch 1 needs to be split in two. Patches 2 and 3 would go via Johannes.
The wimax patch needs to go to staging (wimax code has been moved).
The remaining patches can be posted individually, not as a series.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
