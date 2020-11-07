Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJBZ-0007qd-QX
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:03:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4] ath11k: cold boot calibration support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1602862111-14063-1-git-send-email-ssreeela@codeaurora.org>
References: <1602862111-14063-1-git-send-email-ssreeela@codeaurora.org>
Message-Id: <20201107080204.4370AC433C8@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:02:04 +0000 (UTC)
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
To: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sowmiya Sree Elavalagan <ssreeela@codeaurora.org> wrote:

> cold boot calibration is the process to calibrate all the channels
> during the boot-up to avoid the calibration delay during the
> channel change.
> During the boot-up, firmware started in cold boot calibration mode
> Firmware calibrate all channels and generate CalDb(DDR).
> Subsequent wifi bringup will reuse the same CalDb.
> Firmware is restarted in normal mode to continue the normal operation.
> 
> caldb memory address send to firmware through the QMI message.Firmware
> use this address to store the caldb data and use it until next reboot.
> 
> This will give the improvement during the channel change. But it is
> increasing the boot-up time(up to 15sec depend on number of radios).
> So if the user want to reduce the boot-up time and accepting for channel
> change delay, user can disable this feature using the module param
> cold_boot_cal=0.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01162-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Co-developed-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

02f9d3c1b918 ath11k: cold boot calibration support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1602862111-14063-1-git-send-email-ssreeela@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
