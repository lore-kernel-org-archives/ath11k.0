Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfpyx-0000L0-8h
 for ath11k@lists.infradead.org; Thu, 19 Nov 2020 19:52:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
References: <87sg95t9ez.fsf@codeaurora.org>
Date: Thu, 19 Nov 2020 21:52:26 +0200
In-Reply-To: <87sg95t9ez.fsf@codeaurora.org> (Kalle Valo's message of "Thu, 19
 Nov 2020 21:48:36 +0200")
Message-ID: <87o8jtt98l.fsf@codeaurora.org>
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
To: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> (Bcc: people reporting qca6390 problems)
>
> Hi,
>
> I collected all important QCA6390 fixes to ath11k-qca6390 branch so that
> there's a good baseline for all testing:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-qca6390-bringup
>
> At the moment it's based on v5.10-rc4 and I will try to update it to a
> recent -rc release every few weeks or so. Everytime I update the branch
> I create a new tag and the latest tag is now:
>
> ath11k-qca6390-bringup-202011191920
>
> In this tag there's now a brand new implementation for suspend, which
> relies that the platform provides power to QCA6390 during suspend. Not
> all platforms do, but most of them should do that. ath11k also prints a
> warning whenever it notices that the firmware has crashed, but I'm not
> sure yet if it (the MHI subsystem to be exact) can detect every case.
>
> The MSI patch is mostly the same, it had just some refactoring since the
> last version. Unfortunately there's no solution still for the weird
> crashes some people are seeing.

Forgot to mention when debugging ath11k PCI issues it's a good idea to
enable MHI debug messages. To do that enable CONFIG_MHI_BUS_DEBUG and
CONFIG_DYNAMIC_DEBUG and run:

sudo sh -c "echo -n 'module mhi +p' > /sys/kernel/debug/dynamic_debug/control"

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
