Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86899E77188
	for <ath11k@archiver.kernel.org>; Fri,  3 Jan 2025 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGB8nJCzb5yHLiu2JB0xT5s1DN9ayx5bmIexjSS5sZE=; b=1aFGGnm9a/nAVwVbNrlBiffYk2
	6ShgdJcBYVlboew65yOectjXn9s+sb1FBhJQVUd7Xg8n5lPi4GlBNjXsFyc8rVYOi8UG6oYJYO6gE
	6RL81Pd6JMUPH+qZcXBiqF9JQqz6zkyugpbocOVa19ZvaFGE3ZGg8NComoGVjn2smT0DOAeRiKCq7
	9cplmUHFHGF4VvY9MAv2avzfKyY70kSjquKxKPL0Srt5mXW9TRY2luvP4rPqoMCXVQJz0vnuT+U+U
	AOiDHJAj82ey0Bv4EQyoIUSY2B/h0M9wzfwMIzHz0EVVmThEHYdj/8c++2m3VhOuEZZcLWcaUBuaV
	Aav+ttkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjS7-0000000DFHU-0PMw;
	Fri, 03 Jan 2025 15:19:07 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjS4-0000000DFGX-1xlU
	for ath11k@lists.infradead.org;
	Fri, 03 Jan 2025 15:19:05 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7b6f1b54dc3so1824811885a.1
        for <ath11k@lists.infradead.org>; Fri, 03 Jan 2025 07:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1735917543; x=1736522343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CGB8nJCzb5yHLiu2JB0xT5s1DN9ayx5bmIexjSS5sZE=;
        b=KzIr3HluXfQmQBpa32g+MOCACgMJ0CKD1/mpDXYTBeBo7ZSQZo2OvtX8QKb1kG8w4S
         fe8rm5jiA8JjxalmgPEXd1T5t0CwmGLAocuUcYgkIHvLuh3uT10t9HCGUNU0xkPpTY1D
         HItw1H+s3JsxfZ3rGUVwALYnjq0lAWfxCx2kh5jw8SL8R/qKIAg7r1plb6MIA9xSyxyR
         t+Fsix+QgsMNgXhe8aX27EPyp6wpIDFaBeWxTYOKhEHSyre5WSfN50lAP2EvkcuhTurr
         pgZOQGoSLyU6nEXbTg4GiGODpXKKhjT1+3kh2t4MncuZSTkzdlXb44UC1md59dIUt0P6
         SrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735917543; x=1736522343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGB8nJCzb5yHLiu2JB0xT5s1DN9ayx5bmIexjSS5sZE=;
        b=OL6tMS/FaYw72egR94bm8B3Lfp8dfXr+1OqH3IW9QzdI3/J2D1UEL0vAdvQi7mQ06Y
         1CmbAPW8eX5MTndT0rBNJQTaQ3ktI8WnQHhcEHFzDMysoGSqAvhF7DzIBv+HH+Lyt+7z
         iy5Mgkmfy3pW5PjzcBveGwNMIW8f41UAOx+O9DjwpJ5MtHUeGMzWfKD068CKV3eujCd+
         Z3+bdl5Qyk5+pFWx6B90i3UFhC0641kmd3oxpcmQyaaGQyVBH/XfyvR3+/TcZQ7SZ0/r
         7RDxqCZAmrcmOhmT+AznpXoEchaTUPvF9aKWkrGAbEUjkE3hsUXl0fOiDhJIcaTmup/1
         BnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0yVd/RBA41c6CfufIYteiLq8bduv4wkEidFkSNXp4eW2VTvMBRejb9dr8kffhYzDGqoyTSV0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxewrqDEx1NGDx9FwQad8zGlLNd+jWksLS4RM5Lz0EbBchViRAR
	OQYQsQ6gHG6fo5Qwl7BP2ttMqU75R1lXEv3wMCJW1qS2KaRlPWHcwi+UcB4TGOM=
X-Gm-Gg: ASbGncte0Mkfpsp+vAZ6g501ROmnoQc9xOzp+8p+WjNTyQHigBgcAZMErKGvqwxTLyz
	5/kh1Pem+aGJDAPzJIzgZ1dbIatKRT/7X5rP+pWRCdU0xZup+0rrr4J9+tPxbpsJWC1H4+tkwxp
	ndB2w3hUl4QXy8xEn4Ie+axwst7ws2+oAnH9EvLIvybvSHGA51CsDYCiIU7qy6Mb7LEPTbF0VXB
	Zj/SJb9FBxUMFIXEmJmLS62PwpsiKDceb7+ttg66XJ8CpI9/Ptt35ySRy68v29ThVoc3zS4aFnU
	Q/JnBDh/wUfI1cCQvqA1NabaYFDzlw==
X-Google-Smtp-Source: AGHT+IHTG+Bq32SHg17tHpm9vXIkHAkuaGHUCVV1avASRsb7eSYGQtc9W1/GwgW3NuW7igfw1fFU3w==
X-Received: by 2002:a05:620a:488a:b0:7b6:d5cb:43a9 with SMTP id af79cd13be357-7b9ba773db8mr7230744485a.23.1735917542951;
        Fri, 03 Jan 2025 07:19:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478f0fsm1277723385a.71.2025.01.03.07.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:19:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tTjS0-00000000iwx-2edn;
	Fri, 03 Jan 2025 11:19:00 -0400
Date: Fri, 3 Jan 2025 11:19:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
	quic_bqiang@quicinc.com, kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20250103151900.GE26854@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170014.1583783-1-alex.williamson@redhat.com>
 <20240813163053.GK1985367@ziepe.ca>
 <87r0aspby6.ffs@tglx>
 <03fdfde8dc05ecce1f1edececf0800d8cb919ac1.camel@infradead.org>
 <20250103143138.GC26854@ziepe.ca>
 <432d4304b579c5bd6973628c3c4aaad476627f7b.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <432d4304b579c5bd6973628c3c4aaad476627f7b.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_071904_505561_4028AF81 
X-CRM114-Status: GOOD (  10.95  )
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

On Fri, Jan 03, 2025 at 02:47:11PM +0000, David Woodhouse wrote:

> Probably best for the hypervisor to have some way to *advertise* that
> it's handling this though, as guests also might want to run on
> hypervisors which don't.

If the hypervisor doesn't properly virtualize the device it shouldn't
assign it to a VM to start with :\

Intel looked at the question of advertising clean interrupt remapping
when trying to virtualize IMS and it didn't seem so great.

Bare metal machines need to work, so any test they could think of
adding would either fail on bare metal or fail on existing VMs.

VMM's have taken the approach of not telling the guest they are in VMs
and then also not implementing the bare metal HW behaviors with full
fidelity. So we have no way to discover that the VMM is, in fact,
emulating broken "hw".

Thus we get this push that all kernels need to accomodate the worst
VMM behaviors :(

Jason

