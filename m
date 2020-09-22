Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKbGL-0008TV-L6
 for ath11k@lists.infradead.org; Tue, 22 Sep 2020 05:54:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [kbuild-all] Re: [PATCH v3] ath11k: cold boot calibration support
References: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>
 <202009160303.xwD2GbBx%lkp@intel.com> <87v9g7459d.fsf@codeaurora.org>
 <fef872c3-cf44-d89d-3c3a-d305e3a702a5@intel.com>
Date: Tue, 22 Sep 2020 08:54:29 +0300
In-Reply-To: <fef872c3-cf44-d89d-3c3a-d305e3a702a5@intel.com> (Rong Chen's
 message of "Tue, 22 Sep 2020 13:07:57 +0800")
Message-ID: <87lfh21hm2.fsf@codeaurora.org>
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
To: Rong Chen <rong.a.chen@intel.com>
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>, Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>, kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Rong Chen <rong.a.chen@intel.com> writes:

> On 9/21/20 9:40 PM, Kalle Valo wrote:
>> kernel test robot <lkp@intel.com> writes:
>>
>>> Thank you for the patch! Yet something to improve:
>>>
>>> [auto build test ERROR on ath6kl/ath-next]
>>> [also build test ERROR on next-20200915]
>>> [cannot apply to v5.9-rc5]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:
>>> https://github.com/0day-ci/linux/commits/Sowmiya-Sree-Elavalagan/ath11k-cold-boot-calibration-support/20200915-180324
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
>>> config: mips-allmodconfig (attached as .config)
>>> compiler: mips-linux-gcc (GCC) 9.3.0
>>> reproduce (this is a W=1 build):
>>>          wget
>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>>> -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>> ERROR: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko] undefined!
>>>>> ERROR: modpost: "ath11k_cold_boot_cal"
>>> [drivers/net/wireless/ath/ath11k/ath11k_ahb.ko] undefined!
>> For some reason I don't see the kbuild bot report above in patchwork:
>>
>> https://patchwork.kernel.org/patch/11775953/
>>
>> This time the message ids seem to be ok:
>>
>> Message-Id: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>
>> [...]
>> In-Reply-To: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>
>> References: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>
>>
>> If anyone has ideas why patchwork doesn't see the report, please let me
>> know.
>>
>
> Hi Kalle,
>
> We hided the reports for patchwork, please see
> https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo/-/issues/21

Didn't we discuss before and concluded that hiding the reports from
patchwork is a VERY bad idea? As it should be the opposite, the kbuild
reports should be visible in patchwork so that maintainers see them. For
example, when I'm about to apply a patch I only check the comments in
patchwork (and not from my email folder), so if the report from the bot
is not on patchwork I will not see it.

But having X-Patchwork-Hint set in the automatically created patches
sent by kbuild bot is ok, and I believe that's what kbuild bot currently
does. The bot should not set X-Patchwork-Hint in report emails.
 
Anyway, I don't think that was the problem in this case as I don't see
X-Patchwork-Hint header set in the report above.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
