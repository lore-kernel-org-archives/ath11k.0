Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F025C433F5
	for <ath11k@archiver.kernel.org>; Mon, 18 Apr 2022 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viQs+CtgL60LsQ65N3/FSB63IkLhvRImaGLZYBn17wk=; b=efHuIMxV1jmC1W
	IoYKvKua6gP2sMwuk9fBycESpol+zZrTU17krQYikApx+KfieN1HmpG8w10xJ+pd2NLjYhSV1YWVi
	VTXA+cefTYBoDfL93efev99QwPRng7Tf+1KMCDjSKn/i/E4iUO7VmicNjKopqCXpJbnliO0cis9ca
	Ncst8PVg7BfLHPIFPmhcqnqVh2hHOt2zFOfe+EfScqJWV7WEfdO60Eme81KrNdCqVWG3JjmBRraet
	lqd9RIOh0FhdrHe9eP6GQLOjSDG8FRaaUs4CMz7mPsq8FRvkAeZDDCP0bU6LYuxX9hKqRqyYPFejw
	lWlB2ZxfaP5TmbP6M31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngNg1-00GBXd-Fp; Mon, 18 Apr 2022 09:28:09 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngNfz-00GBWY-7H
 for ath11k@lists.infradead.org; Mon, 18 Apr 2022 09:28:09 +0000
Received: by mail-io1-xd2b.google.com with SMTP id 79so5585759iou.7
 for <ath11k@lists.infradead.org>; Mon, 18 Apr 2022 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FaQOlUJix4yFuB5CH/6B17uEkGVHX30sxwJuchIu5n8=;
 b=nidaia2sKNsL//0XWOC+MZDOrB4kCOWWiKkEfAJsuNKLl3J3WifnsemZU8qclBJf7v
 IPPtYGrDF1edjyzBjHKbZRyLwik49supj14kKhUaTqbO/k7qqNLScL0j7RLYKMI7AdLc
 FNtW1kqB1Z1bqIApI5UMvOPs7NbKUZCBn4r76L4Uz/hcd/djEJQLykyOk56ilF8KmAqh
 e9IyCQW82sOR4c+Slz6TPQJD1EhbtrgFhDXn++qu42RGacGTzvFiZ2x7h2ySYHDkRyPV
 RkyIfmBd05lDQYFRaTl4kvyvRVQxk4+DBUrDK14IgcwtTW0B/2aB8tZTkGDuOeKS1Xel
 qDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FaQOlUJix4yFuB5CH/6B17uEkGVHX30sxwJuchIu5n8=;
 b=iy4wKU3vKOP/gSHtF0c38SEmPzl+xhjUpzvV1uz4Ol7QJweHbd2ikOdoxMk/tUGe54
 MhK3W9IhNNUWbtdoXYkTEN/ONNGlItAG3+Ej8y24o+GZOtcsCd7j0aZJ5BtP1/0M+1Kl
 mCHVi3GtQy3wx8K83HbyIbfH/fDKY68GpF1cJBSGzcwfoTGLI64NQwn5T5M97ZM7eFUn
 uonMpcuMfPff+PUpE/CtfCy0U4YC+DFhtPtICxfQjUqlPmkHcIYIEH3MAeh3jBkVHiI5
 CTda9dBChM4MZeeWWYIuo3EphChC08vUKQH7DkhkaSkDiSS0EdhF9j++X+4HtiGuZQdE
 B1Mw==
X-Gm-Message-State: AOAM530FhrFdn3KUHLVa0i800DJMrzh++fcgMh42foXF/vb/2GGgiR8d
 bvZb/+uRzwp60e+4Rjb5eBRfC5y4/CGyE74B6mAw+w==
X-Google-Smtp-Source: ABdhPJys3D5mk8R9AXcoaZDHB98axCHh/JUKrK0s/b7e3cTO43mbjB4Q4314aAD2+A5WJn3oJOhoKNxbo39osn0eCiY=
X-Received: by 2002:a05:6638:3494:b0:326:274a:a33b with SMTP id
 t20-20020a056638349400b00326274aa33bmr4819864jal.317.1650274085117; Mon, 18
 Apr 2022 02:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
In-Reply-To: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 18 Apr 2022 11:27:54 +0200
Message-ID: <CA+HBbNHQ_VY6EnGoTSc2SjTV+zMzJ8Uqq_V7c4w=vD3dsB2fzA@mail.gmail.com>
Subject: Re: ath11k: does qmi support multiple soc
To: fengbin <arithdon@gmail.com>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_022807_492858_87AB46C0 
X-CRM114-Status: GOOD (  15.73  )
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

On Mon, Apr 18, 2022 at 10:37 AM fengbin <arithdon@gmail.com> wrote:
>
> Hello,
> I have qca6390 and qcn9074 both of them works fine individually.
> However when I install them together errors show up.
>
>
> here is log with only 9074 installed:
> [   17.759191] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
> connected qmi:00000000181299d3 node:7, port:2
> [   17.759197] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2709 qmi:00000000181299d3
> [   17.760436] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2718 qmi:00000000181299d3
> fw_ind_register completed.
> [   17.761703] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2725 qmi:00000000181299d3
> fw_ind_register host_cap completed.
> [   17.767555] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0
> board_id 0xff soc_id 0xffffffff
> [   17.767559] ath11k_pci 0000:01:00.0: fw_version 0x2506844c
> fw_build_timestamp 2021-07-13 10:24 fw_build_id
> [   19.495395] ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
>
> and here is log with 6390+9074 and from the log it seems 01:00.01
> device get same qmi messages twice and thus the host_cap request
> failed the second time where chipset FW consider the host_cap request
> is in bad state.
>
> [   19.106915] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
> 0x92000000-0x921fffff 64bit]
> [   19.106947] ath11k_pci 0000:01:00.0: enabling device (0100 -> 0102)
> [   19.107355] ath11k_pci 0000:01:00.0: MSI vectors: 16
> [   19.107366] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
> [   19.107505] ath11k_pci 0000:01:00.0: mhi controller registered
> :0000000054128108 mhi_ctrl->index:0 mhi_ctrl->mhi_dev:mhi0
> [   20.173172] ath11k_pci 0000:05:00.0: BAR 0: assigned [mem
> 0x91000000-0x91ffffff 64bit]
> [   20.173218] ath11k_pci 0000:05:00.0: enabling device (0100 -> 0102)
> [   20.173937] ath11k_pci 0000:05:00.0: MSI vectors: 32
> [   20.173959] ath11k_pci 0000:05:00.0: qca6390 hw2.0
> [   20.174111] ath11k_pci 0000:05:00.0: mhi controller registered
> :00000000c33f02d3 mhi_ctrl->index:1 mhi_ctrl->mhi_dev:mhi1
> [   20.767399] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
> connected qmi:00000000e25ddf03 node:7, port:2
> [   20.767423] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2709 qmi:00000000e25ddf03
> [   20.768739] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2718 qmi:00000000e25ddf03
> fw_ind_register completed.
> [   20.770333] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2725 qmi:00000000e25ddf03
> fw_ind_register host_cap completed.
> [   20.770375] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
> connected qmi:00000000e25ddf03 node:7, port:2
> [   20.771668] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2709 qmi:00000000e25ddf03
> [   20.776796] ath11k_pci 0000:01:00.0:
> ath11k_qmi_event_server_arrive@2718 qmi:00000000e25ddf03
> fw_ind_register completed.
> [   20.778021] ath11k_pci 0000:01:00.0: host capability request failed: 1 90
>
>
> Any thoughts and ideas of what might be the cause?
> thanks

Hi,
I would second this question as I have the same issue with IPQ8074+QCN9074.
Note that the multiple debugfs patch has already been applied.

Regards,
Robert
>
> --
> arithdon
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
