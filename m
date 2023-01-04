Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3B4C4332F
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 03:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxbFfe4HDJfCeppojiup+SpuoxZWX9vzpZAWthGxV+I=; b=pGUmVfii2wd7Gq
	LkcSiwnezuP71GYyhdMqPVs8sJ5x4Orvy4XCyH8/bYQ0dcisf31qeDABFNhHmJg7It09sQVRK3Q+6
	tumgwOUyr0sir1xbpd71gOxjf1w/tCupzMPuasHiBgkntp5BDLz7vpjnN72vLgd59bqQahkVMiqVb
	3Ri39V92E23otThUqljKMaCnHpP9K+fE5cqgTkKiAOp2l8l0gbI8rMqdIBVcZ5hrDeaJlEE5LlQHh
	cqmCaOw+rWadGzxvFkrplpVnWiwZQ9M12/VsrgtlslimDP8mqMWbYXp72up77uSUSFrNDXZB/uHlS
	7nJ/ch0CEMSbeIg+K5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCuYk-006aB9-Oa; Wed, 04 Jan 2023 03:35:22 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCuYX-006a7K-Hj
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 03:35:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id u28so42089416edd.10
        for <ath11k@lists.infradead.org>; Tue, 03 Jan 2023 19:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rg/4sD9rsFme2W7/tIqbHRALCzSlujDOlXVJMQfwtKg=;
        b=ZgaWET0nvy7ALz28iMroptnlY+TgxZ8mg6QGNd1CZV9YYogAaxl4Hx1XWIecY5BJEu
         YPhmUIRHfzb4tnodH3d6E0ZUKyE/JXkYe52TCp/48rUTHgU5TC4HUyoaIu/ku5WvwvUK
         d4zPJ3X3rqovgW3U7MoLoCVwZSjqGjeK/t1wUtm9kuIn0SJH6ovZnF8QHjdutKS3v+Mh
         vNNnUjPLWc72Z7IT3WejpLD5u83wOaflXoLZqntzwy6BcM/KDES9ibzAjvKNoVigwnYb
         3opaD2n82MPHMrfKnDkZax3Y1/ur7xMX1TRxwQSnbEV4ZlKoZLByLYfKVXqOsvsKOHwu
         QLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rg/4sD9rsFme2W7/tIqbHRALCzSlujDOlXVJMQfwtKg=;
        b=1U/xTpXMqT5gUMITYSmshJ/5/bcNWIpLQZyvl1OIEI+db1pTpsvXGPV1M/tlaVVqml
         8XOjc7qrUu8oNe8m/vqmGIePLfjN5WUMDm8iS8AFZRENYOhnvfuI+dzdMQ5gjn6Gplw6
         luSu9EC1e9YwoQqjjvZCsH1Fkbe11dCsn8ImPP1Y2C3bp4cky7T02Di4FkKxksyRd3e7
         4oHjlHuSxnv4ESoUqxmxOvSi7xhVpoLnV47RuTqebe+LOkh3A71mNLqNY0SgnowqBm76
         1v7D3KSDPMOyWdZ06ohn2uDjbsBXThcadhWxgQtIcxlvXzE1oNsN9pOR75rY7Z1JGKmC
         MdTQ==
X-Gm-Message-State: AFqh2kr8Jx8N+L+84+H5L9m+LidB8Q29vnMNVrdMMP+iWU6ZoctNHovv
	azUOOq9pbj3Wpb1CLpIb4zB7dClclghEzFNr4yM=
X-Google-Smtp-Source: AMrXdXuRsu44HxVyHbVKzh3xjrg8EVZH3Jc8BlfDz5MGuWEaxW9E+Aef5xAJB2ix45FtZ4NgGQuSFKJsxYOWom+eOgY=
X-Received: by 2002:a50:951e:0:b0:484:a88c:a850 with SMTP id
 u30-20020a50951e000000b00484a88ca850mr2796037eda.400.1672803306466; Tue, 03
 Jan 2023 19:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20230104021445.47484-1-quic_bqiang@quicinc.com>
 <CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com>
 <7dac372b-167c-2dff-b207-6e32fd40c7bb@quicinc.com> <CAOCk7NqNrxcXLsw3PRRdsiOrq5SB9DfxpuSH84-rB9-43fdpog@mail.gmail.com>
 <b0e8d03f-0e4e-b736-aa9d-cd49181d9041@quicinc.com>
In-Reply-To: <b0e8d03f-0e4e-b736-aa9d-cd49181d9041@quicinc.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 3 Jan 2023 20:34:55 -0700
Message-ID: <CAOCk7NrnfjZR5ADcVk4iSt9_aP5_9Aamb4eJBoBq7hDH1SVoVg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: Change the log levels for SYS_ERR event
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, mhi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_193509_691346_0AE235A5 
X-CRM114-Status: GOOD (  33.82  )
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

So your firmware is glitching, but it isn't kicking you to the RDDM
EE?  RDDM EE triggers an entirely different code path than the syserr
process. If that assumption is correct, then I'm not entirely sure why
that check exists since the current code would do the syserr
processing only if it's not a RDDM event.

There are other reasons the FW might trigger syserr, which would not
be a fatal error or rddm, and that should trigger both the
controller's processing as well as the MHI core.

If I were to guess, I would say that Hemanth and Bhaumik had that in
there because they were concerned about the RDDM processing triggering
multiple times.  I don't see how RDDM processing can trigger without
the RDDM EE, which seems to make that concern moot.  Sadly, I can no
longer ask them to confirm.

Have you experimented with removing that check?  That seems like a
valid fix for your system.  What you propose is bypassing the dynamic
debug mechanism, which doesn't seem justified in this case from what
I've seen so far.

-Jeff

On Tue, Jan 3, 2023 at 8:17 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>
>
> On 1/4/2023 11:11 AM, Jeffrey Hugo wrote:
> > On Tue, Jan 3, 2023 at 7:57 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
> >>
> >> On 1/4/2023 10:41 AM, Jeffrey Hugo wrote:
> >>> Why was this not sent to the MHI mailing list?
> >> I don't know the MHI mailing list address, could tell me that?
> > The relevant entry from MAINTAINERS -
> >
> > MHI BUS
> > M: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > L: mhi@lists.linux.dev
> > L: linux-arm-msm@vger.kernel.org
> > S: Maintained
> > T: git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
> > F: Documentation/ABI/stable/sysfs-bus-mhi
> > F: Documentation/mhi/
> > F: drivers/bus/mhi/
> > F: include/linux/mhi.h
> >
> >>> On Tue, Jan 3, 2023 at 7:19 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
> >>>> Currently no log printed when SYS_ERR happens, this makes
> >>>> debug quite hard, so change log level to make it noisy.
> >>> You are going to need to explain this more.
> >>> There are two drivers in the upstream kernel that are MHI clients -
> >>> pci_generic and ath11k.
> >>> I'm assuming that you care about ath11k because you included that mail list.
> >> Yes, I am talking about ath11k.
> >>> In ath11k_mhi_op_status_cb() I see a warning message printed when the
> >>> syserr callback is triggered.
> >>> I see something similar in pci_generic.
> >>>
> >>> Looks like a log is printed when SYS_ERR happens in all possible
> >>> scenarios, so I don't understand the point of this change.
> >>> Particularly given that dev_dbg messages can be trivially enabled.
> >>>
> >>> -Jeff
> >> Well, this is not true in some cases. For example, we have met cases where
> >>
> >> WLAN HW/firmware is not working well, and only send a SYS_ERR event to MHI
> >>
> >> driver, however this event is not sent to ath11k host becuase of
> >> mhi_pm_sys_err_handler(),
> >>
> >> so we got no log at all.
> >>
> > With the 6.1 kernel?
> >
> > mhi_pm_sys_err_handler() queues the st_worker.
> >
> > mhi_pm_st_worker() , which is the st_worker function, calls
> > mhi_pm_sys_error_transition() in the DEV_ST_TRANSITION_SYS_ERR case
> > (we are processing a SYS_ERR).
> >
> > Pretty much the first thing mhi_pm_sys_err_transition() does is this -
> >
> > /* We must notify MHI control driver so it can clean up first */
> > mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
> >
> > Which calls the ath11k driver ath11k_mhi_op_status_cb() I mentioned earlier.
> >
> > -Jeff
>
>
> No, mhi_pm_sys_err_handler() will NOT queue the st_worker because ath11k
> host supports RDDM, so the SYS_ERR event will be skipped. See below log:
>
> kernel: [  165.393720] mhi mhi0: local ee: MISSION MODE state: M0 device
> ee: RAMDUMP DOWNLOAD MODE state: M0
> kernel: [  165.401820] mhi mhi0: State change event to state: SYS ERROR
> kernel: [  165.401824] mhi mhi0: System error detected
> kernel: [  165.401827] mhi mhi0: Controller supports RDDM, skip SYS_ERROR
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
