Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3C3CD3447
	for <ath11k@archiver.kernel.org>; Fri,  8 May 2026 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP/7ci/J9TJ5edW5yKTAQPEPG3mpePlkU70HrqxFuPU=; b=FCtEbAcDZNXqhBlHckivQF5v5l
	3hpC9IGJzLwZnU8gKOO9edVl/V0qy66HRYtED4roj0a9Fx3sIhM0zjBVdA7BZywc9+IdhP8ZYAIl9
	wxyOeNwlDcLTPt1kF8zdHUmmwiDytuqQPBkWW/6mMj/ebpN/kZbgUjEvdZ8rGlfIOBjUboMRCH1Ot
	JxNRrlzOGJwphoviZrqu6Vc4++EnO9mU6VEPUPm8vnyccqbybEdHSoHbZdQgObc51zjC+pmxW/zo5
	MIzTKFN3hASeG2p/Nuw7yCwhfT706cyeX7LyDihWnlhxMzlWt2qkT+wVm+ay9ge4n3NHG2wdJmL+R
	n1OR5Qaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIVH-00000006EXt-3bHR;
	Fri, 08 May 2026 10:32:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIVF-00000006EX0-1buJ
	for ath11k@lists.infradead.org;
	Fri, 08 May 2026 10:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778236334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YP/7ci/J9TJ5edW5yKTAQPEPG3mpePlkU70HrqxFuPU=;
	b=QDHUc/XokFzSFX5MeZLcvnYOYAwTWQfbwWstOaTFdL90zyTuH7ZZmc6ndC+r/y+5wrO1LI
	stRlgBJalcNHyXI5llsns4zERPjnqHgHC7sSdkBSnMnJDZy3f2IaBkAsOFdWEF4IMcD/D3
	wsH1KIapSXOMFC8XSR9ef3E5z+7omhc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-J-Ot9qY_PMag7huwB8KdpA-1; Fri,
 08 May 2026 06:32:09 -0400
X-MC-Unique: J-Ot9qY_PMag7huwB8KdpA-1
X-Mimecast-MFC-AGG-ID: J-Ot9qY_PMag7huwB8KdpA_1778236328
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E05F9195609D;
	Fri,  8 May 2026 10:32:07 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E0F3300019F;
	Fri,  8 May 2026 10:32:04 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: rameshkumar.sundaram@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
Date: Fri,  8 May 2026 12:31:59 +0200
Message-ID: <20260508103202.456865-1-jtornosm@redhat.com>
In-Reply-To: <336655c6-4dac-46e9-a783-549f0a9cccea@oss.qualcomm.com>
References: <336655c6-4dac-46e9-a783-549f0a9cccea@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Jn4j4VJe761235JpZz3keaBqE5u_Cz5YHeSDmbZfKn8_1778236328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_033217_494387_9FA5FA55 
X-CRM114-Status: GOOD (  10.06  )
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

Hello Rameshkumar,

> What is the exact failure? Do you see any driver error logs when it occurs?
No error log, just the warning.

> Got it. I was just thinking along with the proposed fix — whether we
> might also need to handle the sequencing on QMI failure.
> In other words, do you think the issue(double free) would still be
> reproducible if we include a change like below ?
Yes, I think so and in addition the code is more robust.

There is no need to handle other stuff, the device can be bound again with
no problem.

Thanks

Best regards
José Ignacio


