Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E4FC52D7C
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMSdQnQ3FhCUpwpbbmmBUO0/ktrEqcKJdvt6utUH29g=; b=W5D2RbRGUoNnBTr/dySoqhnpV5
	cK9g2goYYd0wI40VSD1fDpSPNTGnqNE+UacpsIvUtY3eqyxnM951ILSKCXQUjxdpGaarq4SxgHW0X
	tmECTimhJag34sUSl5fjVTM9N10y76+bAs1U6cln1BrzKyChnjfzlFwxj7wHqn2CMU1j+XXPaot9t
	wmSgi5iG1bQBG1knl1RDHvZpjqkwg5ZEy8l6u6OZayEiSVcdxdz0VcpnYcqLY44G4pAt2OI3vIhfi
	OSg4+A71Xatf92BcMH7MNIWFUdGDC9bhOW0sY1XNfzSyIEMHsHwJbP38Fzr2OC36cqTork0XIp2t3
	QOJzPNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdvaR-00000004X27-33Ti;
	Tue, 13 Aug 2024 17:45:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduQJ-00000004Lwc-2HDL
	for ath11k@bombadil.infradead.org;
	Tue, 13 Aug 2024 16:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KMSdQnQ3FhCUpwpbbmmBUO0/ktrEqcKJdvt6utUH29g=; b=qtKGnccnBWJ9BSbjO+R7cnUYRZ
	ZMSKhm9gUJqSL+nxDBzmjhzW4/8sm1wKVRb7x1IGPaJanr2QCMLHIae5T8GK1igdBTvyqV9XqmCB2
	kR5IAbSxrDRaFOBEkv5Slqs0XzqwCqMLSr6F8vnv1WGn4lYrlHeB+94N+G83TXWGuANdsBWNzFiJI
	9lkwraSLGi0nJI3P47rLbolxlS+OlLfyQlKPXY7cbLodFHhD8rJE1Htwt9rm/CVyoWEJRx6yVpaS5
	UKhcmgq1fIgIVajQwXcuGrHcxdRXjPMPnz5+XG0Zd5A5q4XGHiCxGMijdSvqiKJGghbn/gjnxH9S8
	EqEEoVeA==;
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduQG-00000007pTs-1O0b
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 16:31:02 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6bbc1cee9b7so33736016d6.3
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723566655; x=1724171455; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMSdQnQ3FhCUpwpbbmmBUO0/ktrEqcKJdvt6utUH29g=;
        b=mZvtmzq3h369e8IQe/o4ST0YHTLkCwzWPdVim2HyN0mSztu9MBGpWWDIg7Ih2HgSD6
         2Op+4wYQzhNqNZByrzJsQH6ztomik6tKZcVGNRlGgIHEZh10WGKxo5hd6OlmbDq5NghO
         2IgHr7xQl66XfS0MhhFc3KeIxYGvcLzD6YXtZznsS2iDxJDBTvhXiqWKg9H+5TuGbLQ2
         n6HgH4v0coPEzEKuFIOZU+96i5nHzW6mevjQ1q9VOanE9q/0d8E3cGEYUzZ8Tq/HKQsD
         FwJfHLG2OBeWpH6ynr2RBSxrn2E09jk+VJZVEiNkQGjd0CTt4sL0NZH9c8GMOaNdlUZt
         piMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723566655; x=1724171455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMSdQnQ3FhCUpwpbbmmBUO0/ktrEqcKJdvt6utUH29g=;
        b=M2/nI7WJsYTdVTqrHz9HLPd0McCaUVFvM+R6V3BGyeQWV0pO/OBYAd/VUnWIBcPYUX
         oG/drzBgIeBGjaNGQysldA4xZyXbt9ncHYAN1+CZC1CJAk3cM5avDOr+OX4QdlnSUzrJ
         6Ow4QxECVvJ6NDK2zE4hOd9YfujrouUoVvYtUwbEtMnItXzYqGxmw/5fu0Y4RVHU5IQj
         AeXSqqBTLh+8zcGibgUJQl/glzc+pJDXV+vUDWjUv9Pye97gtzAd3U48KMLzZZQzwVxZ
         aczxPwjlbdqd4w1Q/aEUXWg4Jhs5/jM7Pg0KvILKz/bPWXMbt09sW9lwR4NwDMQ5XUHv
         39Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX2B07FtG/vhDaYz0b4v/TJ7q5hj6Fl+AeDcL3z7J95a0j9eIYr8ntx8xAwg/TbKQgAkLmkti2dmqgcKnJFVCM58DZjQkDDwt4dhA==
X-Gm-Message-State: AOJu0YxdMFc61dO3l7jwZYQArmeCUEtSeLGDg+tORVE1jKGWfFjCbchH
	v5GDQmMffpAfOYEX4JYHTrmOVrQmblCaHxT32qGnQ4wHxC+hvODFSF5FpYR9QsU=
X-Google-Smtp-Source: AGHT+IEUMd+MI71+yLFL74PJx8nGR3hiS2e4En+zj4fQF+nZvpu8tgHoyU3czsWLPNshCo8zsk0ICA==
X-Received: by 2002:a05:6214:4601:b0:6b5:dfd8:ece2 with SMTP id 6a1803df08f44-6bf5d1e2142mr320686d6.30.1723566655248;
        Tue, 13 Aug 2024 09:30:55 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82c80132sm35284326d6.42.2024.08.13.09.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:30:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sduQ9-008QZt-Jo;
	Tue, 13 Aug 2024 13:30:53 -0300
Date: Tue, 13 Aug 2024 13:30:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: kvm@vger.kernel.org, quic_bqiang@quicinc.com, kvalo@kernel.org,
	prestwoj@gmail.com, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, dwmw2@infradead.org,
	iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20240813163053.GK1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170014.1583783-1-alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812170014.1583783-1-alex.williamson@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_173100_551387_BD5CBF2A 
X-CRM114-Status: GOOD (  16.94  )
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

On Mon, Aug 12, 2024 at 10:59:12AM -0600, Alex Williamson wrote:
> vfio-pci has always virtualized the MSI address and data registers as
> MSI programming is performed through the SET_IRQS ioctl.  Often this
> virtualization is not used, and in specific cases can be unhelpful.
> 
> One such case where the virtualization is a hinderance is when the
> device contains an onboard interrupt controller programmed by the guest
> driver.  Userspace VMMs have a chance to quirk this programming,
> injecting the host physical MSI information, but only if the userspace
> driver can get access to the host physical address and data registers.
> 
> This introduces a device feature which allows the userspace driver to
> disable virtualization of the MSI capability address and data registers
> in order to provide read-only access the the physical values.

Personally, I very much dislike this. Encouraging such hacky driver
use of the interrupt subsystem is not a good direction. Enabling this
in VMs will further complicate fixing the IRQ usages in these drivers
over the long run.

If the device has it's own interrupt sources then the device needs to
create an irq_chip and related and hook them up properly. Not hackily
read the MSI-X registers and write them someplace else.

Thomas Gleixner has done alot of great work recently to clean this up.

So if you imagine the driver is fixed, then this is not necessary.

Howver, it will still not work in a VM. Making IMS and non-MSI
interrupt controlers work within VMs is still something that needs to
be done.

Jason

