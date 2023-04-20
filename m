Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D3AC77B72
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 05:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cAwTfzx60iXMU5PPQie0fUMb+mIsle48eFkE/3tAKFg=; b=4b6
	BTFiH8BaF2hAkVin/19fyeNz1HxcW5LbkwkDRGysQwOQkf4HMEfKmr5JdJbZERog+WMtrkH6Xalu6
	CA/f4LrMisNfkcIUVfIyjp5xvsAgZ26KXRoNVP/mZdknXmWS3t1xieQMsJj4T3oMiZZzezOxYIwbF
	H8rVoM08lQ4NJFN5JjoMEv9WreDRbVcDro5NbqXIWILfmPsUtRn2XsH1v4a5PZvLVS74exEBsefHp
	VnOfr2vQkgeae0q4S67vUL7pa1dNpTb/yiFF7QpLlRX1fkUjVA5/x7xgTXasHtczgsJyxQACh0m0K
	/ukB02XgqJgIlVGQzmDTFjz1k6hiSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppNB8-0077oM-21;
	Thu, 20 Apr 2023 05:49:58 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppNB5-0077nC-1u
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 05:49:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94f4b911570so37480566b.0
        for <ath11k@lists.infradead.org>; Wed, 19 Apr 2023 22:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681969792; x=1684561792;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mcax8DIcUfZMI9T8eX9QxIGqS/W8xIFbBfAvcZqoNgs=;
        b=rzCMWgJ9a862tIoqei8huLBV1woXzEFNx6GlLcqFTDmaFRmef7BMWO0MxW/aWhoGEH
         ue3jpR6ROipAWOGvPef3elmosq72lL3YIi3KdqSLyNFVEo/iuzRpChmP2iAp6nJML6nn
         BRjwg32HUG+s0V83iKrBwiYPcn48o+5jKoRqJSl14VuHR/l4xWUL3xkZo/zBggYls2jd
         /brCMawuCyTaegSBHz7fyJKn/MZ8qe2Wd8oWcuzjrXVz/WbTcn6s8Lz8/9KCwOQydcJc
         bfqm9RoRLtclF3b9hBU0L+L6om3/PgbL5y62ppb8lW9H+7sYYe510/+eq6WIKTKgetT4
         edxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681969792; x=1684561792;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcax8DIcUfZMI9T8eX9QxIGqS/W8xIFbBfAvcZqoNgs=;
        b=FPl9bEioMIvHNVV9Ktcd9/qyCPCuocgwQwi887B/w0DRJb3zRq8vV7YYBXVNXyka9B
         d0QkshtgglpKRZXh4bVkQB+6nzZexPfoYouAVyhp6SAyUNQ3fc1hlgbTN4z6BxdQHxlx
         6zkuW8R8Ax4+fLAHRTBMxnSeN+o5BqP2RQE37zK6T4/DNV+NxtVP3Uvh8LivitGFvXx3
         /Z6J5EeqTv/xKxyKsdb8GwomNO0fW/QCpWjtqkwdLwd9z8nNvrNRMXznpaQ6vtqt89v7
         FpJQ2+zD3EdA2BgFfjR7oyOt/g2G9Qc9uvqffc09sh9t4O93Od0raF0LZ3MG0kKK0e9k
         40kw==
X-Gm-Message-State: AAQBX9cPYH+LMJek7igZ11KW6DQxELghuR4ri33pdgz/JqLEeXsZ4n+d
	8q+vtSh+6MEQYikC8KcW/HTB+htP706+kSU/TLX2/8rZ2WY=
X-Google-Smtp-Source: AKy350bOSjN9DvHVsJ6LzvRiPsJbFJ81KkkG1HFmcuCF2qEqJG5jvhZWirrwj5zG3IYki2KY+YrUEym0ZHCY0gfnXNA=
X-Received: by 2002:a05:6402:1009:b0:506:7f78:c4d3 with SMTP id
 c9-20020a056402100900b005067f78c4d3mr579051edu.27.1681969792070; Wed, 19 Apr
 2023 22:49:52 -0700 (PDT)
MIME-Version: 1.0
From: Doug Brewer <brewer.doug@gmail.com>
Date: Thu, 20 Apr 2023 13:49:40 +0800
Message-ID: <CAG0V13RiyW0HptSbZ6vxoTCmdjzrYZ9MQxCqKuiczJL9znW0-g@mail.gmail.com>
Subject: QCA9074 problem on rk3568
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_224955_635503_03F105F8 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
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

Hi,

I tried to install linux kernel 6.3-rc7 on my rk3568 evb.  It seems there's
a problem about MHI:

[   11.340558] ath11k_pci 0002:01:00.0: BAR 0: assigned [mem 0x380000000-0x3801f
ffff 64bit]
[   11.341399] ath11k_pci 0002:01:00.0: enabling device (0000 -> 0002)
[   11.422849] ath11k_pci 0002:01:00.0: MSI vectors: 16
[   11.423335] ath11k_pci 0002:01:00.0: qcn9074 hw1.0
[   11.660846] mhi mhi0: Requested to power ON
[   11.661271] mhi mhi0: Power on setup success
[   31.716289] mhi mhi0: MHI did not load image over BHI, ret: -5
[   60.551942] mhi mhi0: Device failed to enter READY state
[   60.552544] mhi mhi0: Error moving from PM state: Firmware Download Error to:
DISABLE
[   60.553376] ath11k_pci 0002:01:00.0: failed to power up mhi: -110
[   60.553972] ath11k_pci 0002:01:00.0: failed to start mhi: -110
[   60.554532] ath11k_pci 0002:01:00.0: failed to power up :-110
[   60.567907] ath11k_pci 0002:01:00.0: failed to create soc core:
-110
[   60.568488] ath11k_pci 0002:01:00.0: failed to init core: -110

Any idea how to fix it?  Thanks.

- Doug

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
