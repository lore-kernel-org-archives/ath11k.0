Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4DCC433F5
	for <ath11k@archiver.kernel.org>; Thu, 10 Mar 2022 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e48Ae1otAWLs5XW5V0lki2p/TFf5m/pDW4Xh4nSBDYQ=; b=V0ot93fjVRP7ke
	Tqd3Cy2bxM/Zrq98NQFccJc0yPEeD7ANtWLZFkKIegfntwS/GIluzY8WRQGvbXBN8ruxVwKM9L/Ay
	5QvAm9Tvhfjh3uUFOJ+nZgHFfqhlW+OlXKCKIRYCTlnMhjTgrimZIFOFqBDqgAXM7a+z6fCtuGm28
	qPhkJ/Lx9X3gcKukbBsloATLmMZpdO8OGJqGwoC9gy2hgJ2kB5FTv8QzCOwUk9rYdIGRFVpq5yRe4
	aiIX79jtP+r+dxlW6ue7pfeKgy4EDBebEXuUMftacCn1Kqq4xZtNni2hfuB9z0GsfbO1PmjZFCGqw
	h63c47Pjm5DFJg9ILZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSDig-00Bp8B-KY; Thu, 10 Mar 2022 08:00:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSDid-00Bp7C-GD
 for ath11k@lists.infradead.org; Thu, 10 Mar 2022 08:00:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3E4161AF5;
 Thu, 10 Mar 2022 08:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568E9C340F3;
 Thu, 10 Mar 2022 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646899217;
 bh=cD2ae26TdyXdZ90Ib6mYDKQO01MMWHicIRUO6mJBBmE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=UyMlOTXBobHA/M2lD/ZursErYUsearXhGOumAdqiI/xjmBwVS0sGtwlWC/M18i4qA
 7tH0zagyUKJrVZ7EVGogprDxblZ2pW9KohlaXliTvv9XFkgqhLfIQtfX72JV24jBmP
 BXdgMOWjWunO9WCVHY29Bg/2Gd39Z8senzMPWcVN3X/5zje3M9taQpmEFUAc+la384
 wAu5yJ1V41kjb/UV5GXj64rvSb0wILOFMKW5FktowwKIpFPJQLqaO8SDEuAJUlielf
 28oWC9nJGyQIw9t5ykbdepDiaiB4NDHHByrdjSdKuNqMLKwD6kaFMZwEFvSPpMqlwV
 oz4uCz7ueeUfw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] ath11k: add fallback board name without variant
 while searching board-2.bin
References: <20211220064829.17557-1-quic_wgong@quicinc.com>
 <20211220064829.17557-2-quic_wgong@quicinc.com>
Date: Thu, 10 Mar 2022 10:00:11 +0200
In-Reply-To: <20211220064829.17557-2-quic_wgong@quicinc.com> (Wen Gong's
 message of "Mon, 20 Dec 2021 01:48:28 -0500")
Message-ID: <871qzas0dw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_000019_868958_3C0A8516 
X-CRM114-Status: GOOD (  22.08  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> writes:

> Sometimes it has a variant value which read from DT or SMBIOS by
> ath11k, and meanwhile it does not have the matched board name in
> board-2.bin, then it will failed at boot up phase.
>
> Add fallback board name which removed variant value and search again
> in board-2.bin when failed with variant and try to load the board
> data again to increase boot up success rate.
>
> dmesg log after this patch:
> [169547.248472] ath11k_pci 0000:05:00.0: boot using board name 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262,variant=test'
> [169547.248565] ath11k_pci 0000:05:00.0: boot firmware request ath11k/WCN6855/hw2.0/board-2.bin size 180324
> [169547.248568] ath11k_pci 0000:05:00.0: board name
> [169547.248570] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 76 65 6e 64 6f 72 3d 31  bus=pci,vendor=1
> [169547.248571] ath11k_pci 0000:05:00.0: 00000010: 37 63 62 2c 64 65 76 69 63 65 3d 31 31 30 33 2c  7cb,device=1103,
> [169547.248572] ath11k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 74 65 6d 2d 76 65 6e 64 6f 72  subsystem-vendor
> [169547.248574] ath11k_pci 0000:05:00.0: 00000030: 3d 31 37 63 62 2c 73 75 62 73 79 73 74 65 6d 2d  =17cb,subsystem-
> [169547.248575] ath11k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3d 33 33 37 34 2c 71 6d 69 2d  device=3374,qmi-
> [169547.248576] ath11k_pci 0000:05:00.0: 00000050: 63 68 69 70 2d 69 64 3d 32 2c 71 6d 69 2d 62 6f  chip-id=2,qmi-bo
> [169547.248577] ath11k_pci 0000:05:00.0: 00000060: 61 72 64 2d 69 64 3d 32 36 32                    ard-id=262
> [169547.248578] ath11k_pci 0000:05:00.0: board name
> [169547.248579] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 76 65 6e 64 6f 72 3d 31  bus=pci,vendor=1
> [169547.248581] ath11k_pci 0000:05:00.0: 00000010: 37 63 62 2c 64 65 76 69 63 65 3d 31 31 30 33 2c  7cb,device=1103,
> [169547.248582] ath11k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 74 65 6d 2d 76 65 6e 64 6f 72  subsystem-vendor
> [169547.248583] ath11k_pci 0000:05:00.0: 00000030: 3d 31 37 63 62 2c 73 75 62 73 79 73 74 65 6d 2d  =17cb,subsystem-
> [169547.248584] ath11k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3d 33 33 37 34 2c 71 6d 69 2d  device=3374,qmi-
> [169547.248585] ath11k_pci 0000:05:00.0: 00000050: 63 68 69 70 2d 69 64 3d 32 2c 71 6d 69 2d 62 6f  chip-id=2,qmi-bo
> [169547.248587] ath11k_pci 0000:05:00.0: 00000060: 61 72 64 2d 69 64 3d 32 36 36                    ard-id=266
> [169547.248588] ath11k_pci 0000:05:00.0: board name
> [169547.248589] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 76 65 6e 64 6f 72 3d 31  bus=pci,vendor=1
> [169547.248590] ath11k_pci 0000:05:00.0: 00000010: 37 63 62 2c 64 65 76 69 63 65 3d 31 31 30 33 2c  7cb,device=1103,
> [169547.248591] ath11k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 74 65 6d 2d 76 65 6e 64 6f 72  subsystem-vendor
> [169547.248592] ath11k_pci 0000:05:00.0: 00000030: 3d 31 37 63 62 2c 73 75 62 73 79 73 74 65 6d 2d  =17cb,subsystem-
> [169547.248594] ath11k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3d 33 33 37 34 2c 71 6d 69 2d  device=3374,qmi-
> [169547.248595] ath11k_pci 0000:05:00.0: 00000050: 63 68 69 70 2d 69 64 3d 31 38 2c 71 6d 69 2d 62  chip-id=18,qmi-b
> [169547.248596] ath11k_pci 0000:05:00.0: 00000060: 6f 61 72 64 2d 69 64 3d 32 36 36                 oard-id=266
> [169547.248597] ath11k_pci 0000:05:00.0: failed to fetch board data for bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262,variant=test from ath11k/WCN6855/hw2.0/board-2.bin
> [169547.248476] ath11k_pci 0000:05:00.0: boot using board name 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262'
> [169547.248634] ath11k_pci 0000:05:00.0: boot firmware request ath11k/WCN6855/hw2.0/board-2.bin size 180324
> [169547.248636] ath11k_pci 0000:05:00.0: board name
> [169547.248637] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 76 65 6e 64 6f 72 3d 31  bus=pci,vendor=1
> [169547.248638] ath11k_pci 0000:05:00.0: 00000010: 37 63 62 2c 64 65 76 69 63 65 3d 31 31 30 33 2c  7cb,device=1103,
> [169547.248639] ath11k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 74 65 6d 2d 76 65 6e 64 6f 72  subsystem-vendor
> [169547.248641] ath11k_pci 0000:05:00.0: 00000030: 3d 31 37 63 62 2c 73 75 62 73 79 73 74 65 6d 2d  =17cb,subsystem-
> [169547.248642] ath11k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3d 33 33 37 34 2c 71 6d 69 2d  device=3374,qmi-
> [169547.248643] ath11k_pci 0000:05:00.0: 00000050: 63 68 69 70 2d 69 64 3d 32 2c 71 6d 69 2d 62 6f  chip-id=2,qmi-bo
> [169547.248645] ath11k_pci 0000:05:00.0: 00000060: 61 72 64 2d 69 64 3d 32 36 32                    ard-id=262
> [169547.248646] ath11k_pci 0000:05:00.0: boot found match for name 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262'
> [169547.248647] ath11k_pci 0000:05:00.0: boot found board data for 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262'
> [169547.248649] ath11k_pci 0000:05:00.0: using board api 2
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> @@ -722,7 +734,7 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
>  
>  out:
>  	if (!bd->data || !bd->len) {
> -		ath11k_err(ab,
> +		ath11k_dbg(ab, ATH11K_DBG_BOOT,
>  			   "failed to fetch board data for %s from %s\n",
>  			   boardname, filepath);
>  		ret = -ENODATA;

This error message was useful as it made easy to find out what board
data file we are missing. An example:

https://bugzilla.kernel.org/show_bug.cgi?id=215586#c0

So I'm worried it will become more difficult if the message is changed
to a debug message. But I don't know what's a good solution either, we
shouldn't print an error message while we are searching for the board
file and print it only after we could not find any. One idea I have was
to print every boardname we tried to find or just print the first
boardname, but don't know really what's the best.

But to summarise, we need to think carefully how to handle the missing
board file case. It's very common for users that a board file is missing
in board-2.bin so the error message should be informative enough.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
