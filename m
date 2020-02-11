Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Vuq-0004WC-Dk
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 13:49:31 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: add thermal sensor device support
References: <1580860830-12696-1-git-send-email-pradeepc@codeaurora.org>
 <1580860830-12696-2-git-send-email-pradeepc@codeaurora.org>
Date: Tue, 11 Feb 2020 15:49:19 +0200
In-Reply-To: <1580860830-12696-2-git-send-email-pradeepc@codeaurora.org>
 (Pradeep Kumar Chitrapu's message of "Wed, 5 Feb 2020 05:30:30 +0530")
Message-ID: <87zhdpw7xc.fsf@kamboji.qca.qualcomm.com>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:

> Temperature sensor generates electrical analog voltage from temperature
> of each chain. The analog voltage is converted to digital value through
> ADC. For reading temperature values fom user space, hw monitoring device
> is used.
>
> Whenever the user requests for current temperature, the driver sends WMI
> command and wait for response. For reading temperature,
>
> cat /sys/class/ieee80211/phy*/device/hwmon/hwmon2/temp1_input
>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Multiple warnings, please fix those and resend the whole series.

drivers/net/wireless/ath/ath11k/wmi.c: In function 'ath11k_wmi_tlv_op_rx':
drivers/net/wireless/ath/ath11k/wmi.c:5651:7: warning: 'pdev_id' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath11k/wmi.c:5641:6: note: 'pdev_id' was declared here
drivers/net/wireless/ath/ath11k/wmi.c:5657:2: warning: 'temp' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath11k/wmi.c:5640:6: note: 'temp' was declared here
drivers/net/wireless/ath/ath11k/wmi.c: In function 'ath11k_wmi_tlv_op_rx':
drivers/net/wireless/ath/ath11k/wmi.c:5651:7: warning: 'pdev_id' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath11k/wmi.c:5641:6: note: 'pdev_id' was declared here
drivers/net/wireless/ath/ath11k/wmi.c:5657:2: warning: 'temp' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath11k/wmi.c:5640:6: note: 'temp' was declared here

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
