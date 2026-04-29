Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C5EFF8864
	for <ath11k@archiver.kernel.org>; Wed, 29 Apr 2026 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isNmRuNuMJx4i8ElKaXr/14tWumKpXs9Ca+p5ETyqY4=; b=ZFdyZL3Zsn4QnXTRwmZT+a3qcK
	52KAlNKjcAjFqEEG/6upSqRqZ38xjwpXtWo4LYdu1bsFhsQxubzETtiPChhXTTtvu5sKK+IQ6tpWJ
	qDu896m4tIXmSB1bv5kZ4NCZF0/Vi1jWyyyTRV0bR5V0x0RuADGRwM63vnBJrWhTzy/HoY0ccMexf
	uuqEXgi2lRhwglywaELuPBSNuwXJIlQLpwT865jGA5VdqOcdRmbwdROZYZSvV0z92H43zuWLzHgSd
	goqaEMjVjekb1tog75CIcgqToisPeLbqDLl2KZJvF0d6D9K9sMfk6lNRnLSH6hFbd7fno1wMFCh34
	Nb5dxVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHxFo-00000002xbM-0oVN;
	Wed, 29 Apr 2026 05:14:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHxFl-00000002xaq-3lWx
	for ath11k@lists.infradead.org;
	Wed, 29 Apr 2026 05:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777439666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isNmRuNuMJx4i8ElKaXr/14tWumKpXs9Ca+p5ETyqY4=;
	b=F9tVPs3q9DpF9p4sMGbsnCc7wG02ncwkf1xybXyqEQYrUZOI1LrHIHaRn7xeZyjDpQDaUv
	PCFPunootiJkAq32RibJO5T6wz0fV6NS6IG5RcG99S8YublA2c9h9vB+VBTEq6+LT7l0UO
	dG4NBTxV48I+QrhQ2xBwP1mcd8DpzlE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-olkNOLz3PZysue0b_2x2Eg-1; Wed,
 29 Apr 2026 01:14:22 -0400
X-MC-Unique: olkNOLz3PZysue0b_2x2Eg-1
X-Mimecast-MFC-AGG-ID: olkNOLz3PZysue0b_2x2Eg_1777439661
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3D4D195608B;
	Wed, 29 Apr 2026 05:14:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.45])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E77C300756E;
	Wed, 29 Apr 2026 05:14:15 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
Date: Wed, 29 Apr 2026 07:14:03 +0200
Message-ID: <20260429051414.6625-1-jtornosm@redhat.com>
In-Reply-To: <c0d2b6df-4109-4c93-b229-7eb2d3fca6a7@oss.qualcomm.com>
References: <c0d2b6df-4109-4c93-b229-7eb2d3fca6a7@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 7XJLEAwWHD_Gfyi8si1CN33DQ0ni1NRTaLPLm23sMOk_1777439661
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_221430_009484_19220985 
X-CRM114-Status: UNSURE (   8.86  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello Baochen,

As I try to comment in the commit description, the warning is not at
the intialization, but comes up when the device is unbinded after a
problem at the initialization stage, because due to the problem the
buffers were released (probe). Later after the problem, if the unbinding
is commanded the buffers are released again.
Setting to NUll after releasing avoids the double free.

The easiest way to reproduce it is to run in a VM the default upstream
kernel (that is always failing on VMs) and just unbind the device
(ath11k_pci).

The same problem was fixed by me for ath12k driver here ca68ce0d9f4b
("wifi: ath12k: fix warning when unbinding"), and I have seen the same problem
is also happening for ath11k driver.

Thanks

Best regards
José Ignacio


