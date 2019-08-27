Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2YKz-0005U5-Fp
 for ath11k@lists.infradead.org; Tue, 27 Aug 2019 10:04:31 +0000
MIME-Version: 1.0
Date: Tue, 27 Aug 2019 15:34:27 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 10/49] ath11k: add debug.c
In-Reply-To: <18655975.RomJW5s5WE@bentobox>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <4441194.D8eDD6Tzdi@bentobox>
 <6622b83f754404ec05b9442027757c5e@codeaurora.org>
 <18655975.RomJW5s5WE@bentobox>
Message-ID: <f93b9c98fcfb9a910c3efc04d11d5aa0@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-08-27 15:23, Sven Eckelmann wrote:
> On Tuesday, 27 August 2019 11:04:23 CEST Anilkumar Kolli wrote:
> [...]
>> > Yes, but it shouldn't kill the complete system.
>> >
>> This will not kill the whole system, This will crash target and we 
>> have
>> mechanism to recover the system.
>> 
>> Hope u have generated the crash with below patch,
>> https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/019-ath11k-disable-q6-recovery-to-crash-kernel.patch?h=win_ap.1.0
>> 
>> Please remove this patch to see the target recover after the crash.
> 
> John also pointed me to this patch yesterday and I have now removed it.
> 
> But the wifi hardware doesn't recover after issuing an assert. All(?) 
> firmware
> request will just timeout:
> 
>     [ 1093.114530] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1093.114555] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1093.118903] ath11k c000000.wifi1: Failed to set dtim period for
> VDEV 0: -11
>     [ 1096.124532] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1096.124554] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1096.128902] ath11k c000000.wifi1: Failed to set CTS prot for 
> VDEV: 0
>     [ 1099.134527] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1099.134547] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1099.138895] ath11k c000000.wifi1: Failed to set preamble for 
> VDEV: 0
>     [ 1102.144526] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1102.144546] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1102.148894] ath11k c000000.wifi1: failed to set mgmt tx rate -11
>     [ 1105.154526] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1105.154547] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1105.158895] ath11k c000000.wifi1: failed to set beacon tx rate 
> -11
>     [ 1114.164529] ath11k c000000.wifi1: wmi command 16387 timeout
>     [ 1114.164553] ath11k c000000.wifi1: failed to send 
> WMI_PDEV_SET_PARAM cmd
>     [ 1114.168899] ath11k c000000.wifi1: Failed to set beacon mode for 
> VDEV: 0
>     [ 1117.174527] ath11k c000000.wifi1: wmi command 28675 timeout
>     [ 1117.174550] ath11k c000000.wifi1: failed to send 
> WMI_BCN_TMPL_CMDID
>     [ 1117.178899] ath11k c000000.wifi1: failed to submit beacon
> template command: -11
>     [ 1117.185231] ath11k c000000.wifi1: failed to update bcn template: 
> -11
>     [ 1120.184524] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1120.184545] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1120.188893] ath11k c000000.wifi1: Failed to set dtim period for
> VDEV 0: -11
>     [ 1123.194527] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1123.194548] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1123.198895] ath11k c000000.wifi1: Failed to set CTS prot for 
> VDEV: 0
>     [ 1126.204526] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1126.204547] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1126.208894] ath11k c000000.wifi1: Failed to set preamble for 
> VDEV: 0
>     [ 1129.214527] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1129.214548] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1129.218897] ath11k c000000.wifi1: failed to set mgmt tx rate -11
>     [ 1132.224525] ath11k c000000.wifi1: wmi command 20488 timeout
>     [ 1132.224546] ath11k c000000.wifi1: failed to send 
> WMI_VDEV_SET_PARAM_CMDID
>     [ 1132.228894] ath11k c000000.wifi1: failed to set beacon tx rate 
> -11
> 
> ath11k must be unloaded + loaded again to fix this problem.
> 

Could you plz try removing below patch?
https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/072-ath11k-print-stats-on-crash.patch?h=win_ap.1.0

-- 
Thanks
Anil.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
