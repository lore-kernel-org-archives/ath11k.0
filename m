Return-Path: <SRS0=Wntk=G5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F236C433DB
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 09:46:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B872255F
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 09:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B872255F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CWafUV98XQjcjj6kI6HkveacVRrIzVs2DkjJ5uvuoEM=; b=uRTkceEn7E0aa/lktmUwdk4VQq
	LcNmRNwsjFRbD3UWl9nP8lHzsMN32G+7cgPURt1Fp5P+7JpJA+WWmGTj0dQsWvOu75DxM78nKKwOX
	dcDXp/A3kkMagVhpua7F1gNUq+d5mmuVx9MEu4y2Lt7YbpsZ72WkoAsyIkL6SbhxjIeuL+zPM1V8j
	l/N4pGKuvVoPxyNfmwDWYwnBkp10TfMAKP/9DVg3Cmfk3nxw4EA3QPudxyy3Lx4HCj7kdwK/g1AiO
	Kre1eB/9BcqycjpZTskba6jE4aaFv/DlT2a4DgNGlGTVBONv+y6N2a8M4c716N/u+3ZvOCgSeavMv
	8pjbJaMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Kv9-0001Ip-UH; Tue, 26 Jan 2021 09:45:59 +0000
Received: from m42-8.mailgun.net ([69.72.42.8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Kv6-0001Hm-PW
 for ath11k@lists.infradead.org; Tue, 26 Jan 2021 09:45:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611654357; h=Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: Sender;
 bh=gyYnwf8gFq48iOY3NGgc/sID15GriA7kqliiWtvr56k=;
 b=gFeXSeXJ9+1MQUnelY18Ykx0LjTbzYLzzP8O82riz6iZ+rd5+g5t68ctzdrEzCNIu932nSA/
 qPqjqJs6cDAfuFvwK0XmTkyxYol0ubVmW6Bxk0ZRYNGbcWWLKA7Umvd9fz3quPltTVsvrdw8
 KGX/M4b41JcIQEJwQt506sJWs94=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 600fe4bdad4c9e395b1aeb10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Jan 2021 09:45:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 20EEFC43461; Tue, 26 Jan 2021 09:45:33 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2ED96C433CA;
 Tue, 26 Jan 2021 09:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2ED96C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
 Balakrishna Godavarthi <bgodavar@codeaurora.org>,
 Marcel Holtmann <marcel@holtmann.org>
Subject: [regression v5.11-rc1] btqca: suspend fails with QCA6390
Date: Tue, 26 Jan 2021 11:45:28 +0200
Message-ID: <87o8hcav5z.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_044557_365053_4F90A9F4 
X-CRM114-Status: GOOD (  15.39  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-bluetooth@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

I got Dell XPS 13 9310 laptop which has QCA6390 wlan/bt device. I
noticed that on v5.11-rc1 suspend fails every time like this:

[   91.134305] Bluetooth: hci0: SSR or FW download time out
[   91.134314] PM: dpm_run_callback(): acpi_subsys_suspend+0x0/0x50 returns -110
[   91.134331] PM: Device serial0-0 failed to suspend: error -110
[   91.134338] PM: Some devices failed to suspend, or early wake event detected

On v5.10 suspend worked just fine and after a bisect I found reverting
commit 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during
suspend") fixes the issue for me. More info below.

Is there a quick fix for this or should the commit be reverted for
v5.11? I think it's important to have btqca suspend working on the final
release as there quite a lot of laptops with QCA6390.

I'll also include ath11k list as we have XPS 13 9310 users there and so
that they are aware of this regression.

Kalle

commit 2be43abac5a839d44bf9d14716573ae0ac920f2b
Author:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
AuthorDate: Tue Oct 6 20:50:21 2020 +0530
Commit:     Marcel Holtmann <marcel@holtmann.org>
CommitDate: Wed Nov 11 12:07:54 2020 +0100

    Bluetooth: hci_qca: Wait for timeout during suspend
    
    Currently qca_suspend() is relied on IBS mechanism. During
    FW download and memory dump collections, IBS will be disabled.
    In those cases, driver will allow suspend and still uses the
    serdev port, which results to errors. Now added a wait timeout
    if suspend is triggered during FW download and memory collections.
    
    Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
    Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
    Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
    Signed-off-by: Marcel Holtmann <marcel@holtmann.org>


stock v5.11-rc5, suspend fails:

[    2.924622] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    2.924624] Bluetooth: BNEP filters: protocol multicast
[    2.924627] Bluetooth: BNEP socket layer initialized
[    3.091669] Bluetooth: hci0: QCA Product ID   :0x00000010
[    3.091673] Bluetooth: hci0: QCA SOC Version  :0x400a0200
[    3.091674] Bluetooth: hci0: QCA ROM Version  :0x00000200
[    3.091674] Bluetooth: hci0: QCA Patch Version:0x00000d2b
[    3.091676] Bluetooth: hci0: QCA controller version 0x02000200
[    3.091676] Bluetooth: hci0: QCA Downloading qca/htbtfw20.tlv
[    3.091689] bluetooth hci0: Direct firmware load for qca/htbtfw20.tlv failed with error -2
[    3.091692] Bluetooth: hci0: QCA Failed to request file: qca/htbtfw20.tlv (-2)
[    3.091693] Bluetooth: hci0: QCA Failed to download patch (-2)
<cut>
[   13.714497] fscrypt: AES-256-CTS-CBC using implementation "cts(cbc-aes-aesni)"
[   13.759753] fscrypt: AES-256-XTS using implementation "xts-aes-aesni"
[   13.818594] broken atomic modeset userspace detected, disabling atomic
[   14.391415] psmouse serio1: Failed to deactivate mouse on isa0060/serio1: -5
[   14.871419] psmouse serio1: Failed to enable mouse on isa0060/serio1
[   19.143493] input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input2
[   19.347355] psmouse serio1: Failed to enable mouse on isa0060/serio1
[   84.758946] PM: suspend entry (s2idle)
[   84.760462] Filesystems sync: 0.001 seconds
[   84.762783] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   84.764319] OOM killer disabled.
[   84.764320] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[   84.765470] printk: Suspending console(s) (use no_console_suspend to debug)
[   87.806250] Bluetooth: hci0: SSR or FW download time out
[   87.806261] PM: dpm_run_callback(): acpi_subsys_suspend+0x0/0x50 returns -110
[   87.806284] PM: Device serial0-0 failed to suspend: error -110
[   87.806292] PM: Some devices failed to suspend, or early wake event detected
[   87.924249] OOM killer enabled.
[   87.924252] Restarting tasks ... done.
[   87.971055] PM: suspend exit
[   87.971133] PM: suspend entry (s2idle)
[   87.975657] Filesystems sync: 0.004 seconds
[   87.976159] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   87.977593] OOM killer disabled.
[   87.977594] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[   87.978699] printk: Suspending console(s) (use no_console_suspend to debug)
[   91.134305] Bluetooth: hci0: SSR or FW download time out
[   91.134314] PM: dpm_run_callback(): acpi_subsys_suspend+0x0/0x50 returns -110
[   91.134331] PM: Device serial0-0 failed to suspend: error -110
[   91.134338] PM: Some devices failed to suspend, or early wake event detected
[   91.255045] OOM killer enabled.
[   91.255048] Restarting tasks ... done.
[   91.298067] PM: suspend exit

v5.11-rc5 plus a revert of 2be43abac5a8, suspend works;

[    3.027425] Bluetooth: hci0: QCA Product ID   :0x00000010
[    3.027428] Bluetooth: hci0: QCA SOC Version  :0x400a0200
[    3.027429] Bluetooth: hci0: QCA ROM Version  :0x00000200
[    3.027430] Bluetooth: hci0: QCA Patch Version:0x00000d2b
[    3.027431] Bluetooth: hci0: QCA controller version 0x02000200
[    3.027433] Bluetooth: hci0: QCA Downloading qca/htbtfw20.tlv
[    3.027449] bluetooth hci0: Direct firmware load for qca/htbtfw20.tlv failed with error -2
[    3.027451] Bluetooth: hci0: QCA Failed to request file: qca/htbtfw20.tlv (-2)
[    3.032824] Bluetooth: hci0: QCA Failed to download patch (-2)
<cut>
[   13.143154] fscrypt: AES-256-CTS-CBC using implementation "cts(cbc-aes-aesni)"
[   13.165061] fscrypt: AES-256-XTS using implementation "xts-aes-aesni"
[   13.225180] broken atomic modeset userspace detected, disabling atomic
[   14.343141] psmouse serio1: Failed to deactivate mouse on isa0060/serio1: -5
[   14.823182] psmouse serio1: Failed to enable mouse on isa0060/serio1
[   19.111270] input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input2
[   19.315153] psmouse serio1: Failed to enable mouse on isa0060/serio1
[  173.918828] PM: suspend entry (s2idle)
[  173.922617] Filesystems sync: 0.003 seconds
[  173.925127] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  173.926656] OOM killer disabled.
[  173.926658] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  173.927776] printk: Suspending console(s) (use no_console_suspend to debug)
[  174.176572] psmouse serio1: Failed to disable mouse on isa0060/serio1
[  175.190979] mhi mhi0: Allowing M3 transition
[  175.190995] mhi mhi0: Wait for M3 completion
[  175.260930] ACPI: EC: interrupt blocked
[  186.827253] ACPI: EC: interrupt unblocked
[  186.968527] mhi mhi0: Entered with PM state: M3, MHI state: M3
[  187.322090] OOM killer enabled.
[  187.322092] Restarting tasks ... done.
[  187.362639] PM: suspend exit

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
