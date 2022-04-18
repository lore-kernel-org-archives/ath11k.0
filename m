Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E06C433EF
	for <ath11k@archiver.kernel.org>; Mon, 18 Apr 2022 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFXAaWTfJpeBgZrZLtPyXzbk6Vs6HDcHWaEwB1l+NEI=; b=VErr1ex3APhwV+
	H3lQ+Wrfnyw8ueHj3Awo6TlOOVCXdVzQ+iLNzcPvGFHmd5kePsJNri1BS6bmME8YbyLd1XHzX8xP2
	bjxDv4xQlUZn19f3OCqX/HB9Z4f8KSXHLAZ2SYLePNuY4f9e+GGeORUGufrv31bWEO3JUcO6Epv67
	bF+h9Tax7l6HnnzA5zw5BgxD1u5hCzQxcK+lrCrt9qCgxj5eKnuCNlokeUH/tGruDOyhm1vBYsOBB
	5VVxMyID30vyTVBN+7zeBrPy5ZWafSbvQwNuvPzbHtXiBuf4eADWZoga1KC/Bnq2UjAQ+BEsn/ukP
	6HCftjQtCQYSVEKLjiJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngONt-00GGOJ-F3; Mon, 18 Apr 2022 10:13:29 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngONr-00GGNJ-0F
 for ath11k@lists.infradead.org; Mon, 18 Apr 2022 10:13:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id bv19so26049613ejb.6
 for <ath11k@lists.infradead.org>; Mon, 18 Apr 2022 03:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ejIvqkEVFp0kcQHAt9+D7TEkOn+Ubdii0LnqHwlC/Ic=;
 b=OH9zwhGsUeCIty6bPzJFbpOcji6irMtOMcmGW/KwKDZQCCUrJ6PoA7yvMvSZvNb1xB
 kZ/IQpXMkyuOagW9gw0LZ7zNnjaNWc59aB07HTeFaoUmAIktxZ3jbRPTC9USL4vM6JBt
 h9Qz9qOAJVxFvJKEyoOpu7KRQQr7YtTaYF/RqetKWsPwm0a+yCqhA1YE5InDwdPF3PNW
 ccL3SNL2xu336l+zAeaPkOgU3y7QJ1pE+KrGMCt7KK4sjyzBlUNSiiHWiG+RDcoVMcXj
 Fwm5/o5ZHTWVL/a7YEuE7olmRJ7smp62lMucXGktPOSAKASaymCXi2bwjCOPsd5Jt77k
 T/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejIvqkEVFp0kcQHAt9+D7TEkOn+Ubdii0LnqHwlC/Ic=;
 b=axA6rWd07f4ejkH81oBm4YRasQysBuRdJBEk8nlFWeL5mGJHyIxSeB3GQORgCCKFJG
 1rpLXw5Hy/B1Inw2l5tYoNbYBXwouEH0xmVeg771EOQF8zeAnoGEVlFpD0oxxHcKMIbj
 IjEk4ECXCAeZ19vEfjTXvLD+C7aZ+VAO6FjOies25Y7x/p5pJO/Wabnz6xnyiu5YQklz
 hf5igOt1MdFY+apMlerRkB0TLseEsjyPZTNWI7+pKEpDLJaUjlFVhNOQIvNtW0cQTmSh
 G2tYW5flfQY42plwl1OP44wO48PXv46ranRuw+yYJPmrR7UybYKkcaLNVRvgtF36DoCk
 tCVQ==
X-Gm-Message-State: AOAM530SVAimmKUwgNd3ZIwNPqc+FzxgRRG+WWFAWGTGsWpm88ba0WTW
 wCMUH+OZscYZI7LDOgY1vCMSoyVnuXOOFpXJH7wUzVEhNxgIOQ==
X-Google-Smtp-Source: ABdhPJxJkUosBQ5ewk/t3jpVe8M1PcvxmIni/kJMldE7Ug+gEK+EyUkxdlHPUK/zYHyWuCQogp0gSRkLCxsmMMX1aR8=
X-Received: by 2002:a17:906:7948:b0:6da:64ed:178e with SMTP id
 l8-20020a170906794800b006da64ed178emr8752571ejo.523.1650276802404; Mon, 18
 Apr 2022 03:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
 <CA+HBbNHQ_VY6EnGoTSc2SjTV+zMzJ8Uqq_V7c4w=vD3dsB2fzA@mail.gmail.com>
In-Reply-To: <CA+HBbNHQ_VY6EnGoTSc2SjTV+zMzJ8Uqq_V7c4w=vD3dsB2fzA@mail.gmail.com>
From: fengbin <arithdon@gmail.com>
Date: Mon, 18 Apr 2022 18:13:12 +0800
Message-ID: <CADP2NhZ1SoyNQsEKDqG1CE=rfcWrgcZZc7=JLx=ErVOp6Qz_Tw@mail.gmail.com>
Subject: Re: ath11k: does qmi support multiple soc
To: Robert Marko <robert.marko@sartura.hr>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_031327_085856_F5B52C25 
X-CRM114-Status: GOOD (  18.00  )
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

yes, the debugfs patch has been applied.

On Mon, Apr 18, 2022 at 5:28 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> On Mon, Apr 18, 2022 at 10:37 AM fengbin <arithdon@gmail.com> wrote:
> >
> > Hello,
> > I have qca6390 and qcn9074 both of them works fine individually.
> > However when I install them together errors show up.
> >
> >
> > here is log with only 9074 installed:
> > [   17.759191] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
> > connected qmi:00000000181299d3 node:7, port:2
> > [   17.759197] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2709 qmi:00000000181299d3
> > [   17.760436] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2718 qmi:00000000181299d3
> > fw_ind_register completed.
> > [   17.761703] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2725 qmi:00000000181299d3
> > fw_ind_register host_cap completed.
> > [   17.767555] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0
> > board_id 0xff soc_id 0xffffffff
> > [   17.767559] ath11k_pci 0000:01:00.0: fw_version 0x2506844c
> > fw_build_timestamp 2021-07-13 10:24 fw_build_id
> > [   19.495395] ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
> >
> > and here is log with 6390+9074 and from the log it seems 01:00.01
> > device get same qmi messages twice and thus the host_cap request
> > failed the second time where chipset FW consider the host_cap request
> > is in bad state.
> >
> > [   19.106915] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
> > 0x92000000-0x921fffff 64bit]
> > [   19.106947] ath11k_pci 0000:01:00.0: enabling device (0100 -> 0102)
> > [   19.107355] ath11k_pci 0000:01:00.0: MSI vectors: 16
> > [   19.107366] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
> > [   19.107505] ath11k_pci 0000:01:00.0: mhi controller registered
> > :0000000054128108 mhi_ctrl->index:0 mhi_ctrl->mhi_dev:mhi0
> > [   20.173172] ath11k_pci 0000:05:00.0: BAR 0: assigned [mem
> > 0x91000000-0x91ffffff 64bit]
> > [   20.173218] ath11k_pci 0000:05:00.0: enabling device (0100 -> 0102)
> > [   20.173937] ath11k_pci 0000:05:00.0: MSI vectors: 32
> > [   20.173959] ath11k_pci 0000:05:00.0: qca6390 hw2.0
> > [   20.174111] ath11k_pci 0000:05:00.0: mhi controller registered
> > :00000000c33f02d3 mhi_ctrl->index:1 mhi_ctrl->mhi_dev:mhi1
> > [   20.767399] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
> > connected qmi:00000000e25ddf03 node:7, port:2
> > [   20.767423] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2709 qmi:00000000e25ddf03
> > [   20.768739] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2718 qmi:00000000e25ddf03
> > fw_ind_register completed.
> > [   20.770333] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2725 qmi:00000000e25ddf03
> > fw_ind_register host_cap completed.
> > [   20.770375] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
> > connected qmi:00000000e25ddf03 node:7, port:2
> > [   20.771668] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2709 qmi:00000000e25ddf03
> > [   20.776796] ath11k_pci 0000:01:00.0:
> > ath11k_qmi_event_server_arrive@2718 qmi:00000000e25ddf03
> > fw_ind_register completed.
> > [   20.778021] ath11k_pci 0000:01:00.0: host capability request failed: 1 90
> >
> >
> > Any thoughts and ideas of what might be the cause?
> > thanks
>
> Hi,
> I would second this question as I have the same issue with IPQ8074+QCN9074.
> Note that the multiple debugfs patch has already been applied.
>
> Regards,
> Robert
> >
> > --
> > arithdon
> >
> > --
> > ath11k mailing list
> > ath11k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath11k
>
>
>
> --
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura Ltd.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr



-- 
arithdon

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
