Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C087C6FD20
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/SLkVyixVy/9jKAs5NsPUGuKtdk44FpbMdcDfKwpmk=; b=j5JERyy6bqMnAR
	66mUTLchm5eM8HOrPBRQVYOFNh1Kgk8ovBHPJDKvZ4aYJrpSeILVYL2f0e9kOk13V8Qs7H7iemfB1
	oxEJQX79/94xvz0XODwFkYeVAjunk1vWW6LMlmBJz5T7EkLbgBp6xn/PhVPvtyCqzsXZ26+LsVaDf
	JdgVSJOalt2Xig4HSfHu511cIZlQ4bZH4H81V7auQnSBZYfjXP7/NMPSn/ASY4ahOUwfrhbxshH1C
	kd4J3hAluaf+ZfusE4UsNjSGTr3iP8UtAVboCf7loNEFQhDxayRC85U+z0pDjXiS1LDyAXlRSsRsW
	rP8DLuK+iAKgxO7SUj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pelZf-00E5JD-2C;
	Tue, 21 Mar 2023 23:39:27 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pelZc-00E5Hs-1f
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 23:39:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id s8so20942379lfr.8
        for <ath11k@lists.infradead.org>; Tue, 21 Mar 2023 16:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679441959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNyPv6VG5C18gPyH6Vrkw1Nd1xJj3k9VFd5IHBvhnFw=;
        b=a6n82SO0FlhJ4MR5qAvJEiNk9I+hyKz3G06Mrltf4f7jeCsDVGc/EjDhSS9SqF9/Ba
         YovdeyHb2GfVCRP2qQsly3GpdTQ4THc9hJhnjb2ZST4BhOlDxuM1Kjem4gAlaujeOnN2
         otPnOPLaBO/lyTE/ktVDup1Y6iVsPH+GHMvcdTRbvkvBnDCt6BnnFisqbASl4nqm2M5/
         qh5tZ6mQL1slWvOk1IUNQderlcyzD1xJIrLVP4ck5T/ODd9kEQsGR3FMXdgBrmTfBBRC
         pUiKi4kBAFWoR3Ld78zciboRmVDkOQIDsipP5lYFngweHjvF1TnJEtXQvr8dzWBQShOZ
         ZvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679441959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNyPv6VG5C18gPyH6Vrkw1Nd1xJj3k9VFd5IHBvhnFw=;
        b=KikFqwIYD/FacGxSF4F8+8bwP9CVRKqJDW0Xdn49SHtaz1qKd6nvK1+x14KIvVFcE5
         oQVL/PxNBzpul5pPRU98CuZxGm5y82fSjfmZM7FOTU8oDYOfE94JGogBJsOoTXlt5hJg
         GGjTHE1+LAwxVQ/OjB+iQd8jfMr2IgoGDgivaLJH+gifqFqRWSA44fs7HFaR5KeNpCRW
         hnAD66JemviCpNdj2ilLnlduwzTeahjwdwIRHyK+XDwJCuTYaJb1CMiQykwoyYVbwD2O
         og17p3fn54qio7aWb6A0f+zRy958wCp30qJksPkTQoG8oUDWylJnLZZjPApyFgGpQRoY
         s3dQ==
X-Gm-Message-State: AO0yUKWrEj8L/Y8xPu2kr1z6SXQ85olWDfDorBBZWEoDdsSXXAUqIZUD
	DWXNRE1Ao/+Wj+NwOFc+Vi5SQQ==
X-Google-Smtp-Source: AK7set8nu+M/8vS4kiIQwf2EElLpGdDN3VFrTNvUb8CypUElZKCcLTvsyVb4tRDbv5KTudAGOcauEQ==
X-Received: by 2002:ac2:44d9:0:b0:4b4:9068:2c0b with SMTP id d25-20020ac244d9000000b004b490682c0bmr1453877lfm.2.1679441958880;
        Tue, 21 Mar 2023 16:39:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r2-20020a19ac42000000b004e8557698f0sm2344970lfc.31.2023.03.21.16.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 16:39:18 -0700 (PDT)
Message-ID: <f08d7310-8c33-ab0b-c9f1-317f737ba37c@linaro.org>
Date: Wed, 22 Mar 2023 01:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
Content-Language: en-GB
To: Kalle Valo <kvalo@kernel.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org
References: <878rgzuw37.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <878rgzuw37.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_163924_623299_13066D2C 
X-CRM114-Status: GOOD (  20.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello Kalle,

On 15/02/2023 11:17, Kalle Valo wrote:
> Hi,
> 
> Here's a new pull request for ath10k and ath11k. We have new hardware
> IPQ5018 and various updates for existing hardware. Especially many have
> requested the firmware update for WCN6855 which seems to fix an
> important suspend problem.
> 
> Please let me know if there are any problems.
> 
> Kalle
> 
> The following changes since commit a253a3723f8a0ee5bc5d4f551981a651ba660186:
> 
>    cnm: update chips&media wave521c firmware. (2023-02-14 12:58:03 -0500)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20230215
> 
> for you to fetch changes up to c7a57ef688f7d99d8338a5d8edddc8836ff0e6de:
> 
>    ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23 (2023-02-15 11:09:53 +0200)
> 
> ----------------------------------------------------------------
> Kalle Valo (7):
>        ath10k: WCN3990 hw1.0: update board-2.bin
>        ath10k: QCA6174 hw3.0: update firmware-sdio-6.bin to version WLAN.RMH.4.4.1-00174
>        ath11k: IPQ5018 hw1.0: add board-2.bin
>        ath11k: IPQ5018 hw1.0: add to WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
>        ath11k: WCN6750 hw1.0: update board-2.bin
>        ath11k: WCN6855 hw2.0: update board-2.bin
>        ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
>   WHENCE                                   |   27 +-
>   ath10k/QCA6174/hw3.0/firmware-sdio-6.bin |  Bin 604416 -> 607252 bytes
>   ath10k/WCN3990/hw1.0/board-2.bin         |  Bin 461060 -> 513892 bytes
>   ath11k/IPQ5018/hw1.0/Notice.txt          | 4094 ++++++++++++++++++++++++++++++
>   ath11k/IPQ5018/hw1.0/board-2.bin         |  Bin 0 -> 524564 bytes
>   ath11k/IPQ5018/hw1.0/m3_fw.b00           |  Bin 0 -> 148 bytes
>   ath11k/IPQ5018/hw1.0/m3_fw.b01           |  Bin 0 -> 136 bytes
>   ath11k/IPQ5018/hw1.0/m3_fw.b02           |  Bin 0 -> 262144 bytes
>   ath11k/IPQ5018/hw1.0/m3_fw.flist         |    3 +
>   ath11k/IPQ5018/hw1.0/m3_fw.mdt           |  Bin 0 -> 284 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b00           |  Bin 0 -> 532 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b01           |  Bin 0 -> 520 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b02           |  Bin 0 -> 7552 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b03           |  Bin 0 -> 545008 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b04           |  Bin 0 -> 86788 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b05           |  Bin 0 -> 17776 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b07           |  Bin 0 -> 1488 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b08           |  Bin 0 -> 4096 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b09           |  Bin 0 -> 2330624 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b10           |  Bin 0 -> 269028 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b11           |  Bin 0 -> 99436 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b13           |  Bin 0 -> 7024 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b14           |  Bin 0 -> 1668 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.flist         |   13 +
>   ath11k/IPQ5018/hw1.0/q6_fw.mdt           |  Bin 0 -> 1052 bytes

For the past several years, the Qualcomm community has been shifting 
from the pack of .mdt+.bNN files to a single .mbn file as a main 
firmware file format. It reduces the back-and-forth between the kernel 
and userspace and also simplifies handling of these files.

In-kernel mdt loader provides backwards compatibility, detecting the 
file type and using .mbn instead of .mdt one, retaining the name (or 
using symlink).

Do you have any plans to also shift from .mdt to .mbn?

>   ath11k/WCN6750/hw1.0/board-2.bin         |  Bin 843548 -> 843548 bytes
>   ath11k/WCN6855/hw2.0/amss.bin            |  Bin 4972544 -> 4980736 bytes
>   ath11k/WCN6855/hw2.0/board-2.bin         |  Bin 1322820 -> 6158196 bytes
>   28 files changed, 4135 insertions(+), 2 deletions(-)
>   create mode 100644 ath11k/IPQ5018/hw1.0/Notice.txt
>   create mode 100644 ath11k/IPQ5018/hw1.0/board-2.bin
>   create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b00
>   create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b01
>   create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b02
>   create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.flist
>   create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.mdt
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b00
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b01
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b02
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b03
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b04
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b05
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b07
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b08
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b09
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b10
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b11
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b13
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b14
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.flist
>   create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.mdt

-- 
With best wishes
Dmitry


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
