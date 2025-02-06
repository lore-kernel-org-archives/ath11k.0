Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54315C02192
	for <ath11k@archiver.kernel.org>; Thu,  6 Feb 2025 02:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/z4GkdOZvjEDxSCGrV/XIvnD7ZGn+b/HUYhhAqOYhA=; b=p+W3FByc4Gl9QCn/GVmL5oHeHW
	B/IbKaPPNJBElqg82N5+iDAWOUi/D1C3MDAcYG73FgOxXqyGfUHnvyT7EzNREcEi4juN2zXryKS4o
	ThlCqm9cZ20uTQ8AOlxL85+JyHQCVqcYkbEpWfACB7MubpIjvfD4AYSU8vhtD665YSxhBSEtVMvyi
	/wTMshbVhL4CXj3ViEe4VcLNuQ9nidScN2EKDr6s/ZVzo9o0Ousfa33iWQ0BwqcUSw0oFj1VNPvjQ
	CqMb/CEaFZp3K2zXwwfEPdO49oV6aoUdIK3yLVUiieHFjZkerxE4Dm8xOm7q1aNDg1SBQ30Red/3N
	csAAsDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfs6g-000000055fc-3iUC;
	Thu, 06 Feb 2025 02:59:10 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfs6e-000000055ed-0g0f
	for ath11k@lists.infradead.org;
	Thu, 06 Feb 2025 02:59:09 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6efe4324f96so4324407b3.1
        for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 18:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738810747; x=1739415547; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l/z4GkdOZvjEDxSCGrV/XIvnD7ZGn+b/HUYhhAqOYhA=;
        b=tZlaCTJOqFtzeGAvzemmJmqJ7Qq3Kbjtn1F8IyGy8DfzlysKFdnpBuRrDBtaRiDx55
         GuiQvFFM5joqeiIug949LX3fbVedCohUVXQcc65GwaY8Qi38HA3Htese8W0dLc32tzGQ
         bg1qwrNPjIlJ/NUIZgCedDbhefKNsQOqFq6bJBCLT9RrT9zOpSZYdaTNMPuHbsTwLvqS
         ObfVevjF1O2FoPVy745cZLKfoR6NYJ23bAit401iqBHIm62t8+3dJcpkw/jQfSmyJKUO
         zIjWMCSLL5ubgLXeO/TQUyRoxWV2UIn3PIwvBHUneihvTWpkd/xUhVGdrx4Kh2PARE46
         wZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738810747; x=1739415547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/z4GkdOZvjEDxSCGrV/XIvnD7ZGn+b/HUYhhAqOYhA=;
        b=wh9pW87VQZmtJ+U4/wbb9PzN6pN8/TpPWJYSHmjsWpwRIsHFsgpwIbhlTRRp8YsuW0
         iK+ojlvVTUN6JxmvinzczR7XHwckVtZu1Y8/lmequVlUNy7C8ivvUjF4oBUr4MldZxEI
         Me4IBtabfYHrP8y6oOIhISjhmyIOSNi7tIV7XrQBjdDPrDNoTBiodh48HhKNgQN5zw+M
         xDmgC0zehb0EMkid0/u26e/GgmaT/BFEvHnHbxajH5t/5bMau563tboiIamVTa7dFnOD
         K2QV1n4hCNdsJZDbwEQK1Rbool8G2unCl765yisJHSQ1BpQvlDVyxDQe45CjbLnJLLaR
         E5qA==
X-Gm-Message-State: AOJu0Yy2ICVZkc9kNB4tJZzmEDeI6BSzW4CWl0zqAqEf4+sgi4q0uTGj
	heY5f8bPXdXMau4vRY6ycypxWcX5z/3zQM3TesBaxyzAvS1sxUJ9u6m4NlZKe812v2wKvrrwiTn
	igQhqwyCEZKGUqnjXppuZbXTt8K8PJfYLs0X6tw==
X-Gm-Gg: ASbGncv3dFFxvqgSwap8Q2eWJeLl/LjkcNdVZwFYuPr7L594Jn/JpUJw0IYB3zMODYN
	u8Uhbrx3mioAjIuJnYzGFH+ib6i/e+Q3foMrNv+5jpa76fwQ6TTbq4szEdXXtKWMYIMQLnGw=
X-Google-Smtp-Source: AGHT+IEUCXp0Z6BlIVSlpQmYiCrMVoIPfBcbK31DQrOkfatSXI/CWz7ZdCWEVfMxuC5acrdTbio7/U55cACpK70t4Vg=
X-Received: by 2002:a05:690c:630f:b0:6ee:a81e:6191 with SMTP id
 00721157ae682-6f989e896bamr49344277b3.22.1738810746798; Wed, 05 Feb 2025
 18:59:06 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
 <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com> <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
 <075e8192-09bf-41c5-863b-5543d7cd4dbe@oss.qualcomm.com>
In-Reply-To: <075e8192-09bf-41c5-863b-5543d7cd4dbe@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Feb 2025 04:58:56 +0200
X-Gm-Features: AWEUYZnVcPacMIF7Wom4Vrv3DZaPEs_wyOvXgEI_JjKTnPB6g9rDSgpN89MnBKA
Message-ID: <CAA8EJpp6-cEjrrY0J1ueT57SVP-k471EosJ3OnHjb-i7JYW96g@mail.gmail.com>
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF, v2
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_185908_211891_48465ED6 
X-CRM114-Status: GOOD (  22.88  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu, 6 Feb 2025 at 04:31, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>
> On 2/5/2025 2:12 PM, Dmitry Baryshkov wrote:
> > On Wed, 5 Feb 2025 at 20:46, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
> >>
> >> On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
> >>> Hello,
> >>>
> >>> With the hopes of getting this into the February linux-firmware release:
> >>> Please add the following BDF file to the archive.
> >>>
> >>> Changes since v1: added regdb from the same archive
> >>>
> >>> * description for what hardware this is
> >>>   - Qualcomm Robotics RB3 gen2 platform
> >>>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> >>> * origin of the board file
> >>>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> >>> release, licenced under LICENSE.qcom
> >>> * ids to be used with the board file
> >>>   - WCN6750 / hw 1.0
> >>>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> >>> * md5sum of each new board file to add
> >>>
> >>> 39b270f43cb6d733cde607bf2b23e2be
> >>> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >>> bfbd247fe961dffc4e7fb413703fb284
> >>> regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >>>
> >>>
> >>
> >> staged...
> >> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b
> >
> > It's proably not worth it now, but it might be nice to have a
> > changelog of any kind. Like 'added BDF for Foo Bar' / 'updated BDF for
> > Foo Baz'. If that's not too troublesome ;-)
> >
>
> The problem is that our workflow from CLO to our ath fork of linux-firmware
> doesn't maintain any history, so any description in CLO would not show up in
> linux-wireless. I actually had a descriptive commit message for the CLO patch,
> but I was convinced to drop it in favor of the boilerplate messages that our
> tooling produces.
>
> I'm thinking that in the future for community-contributed patches that I'll
> insert myself into the workflow and rewrite the commit text before pushing to
> ath/linux-wireless.

Thank you! This might indeed be helpful.



-- 
With best wishes
Dmitry

