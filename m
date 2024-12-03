Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F2FE6C616
	for <ath11k@archiver.kernel.org>; Tue,  3 Dec 2024 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUnucm2fTy2CjmZdyCADxmI4mKYutrlWNpBYbKjw3IA=; b=o+V4Qjt6E8uch4SKjTNjMvRG5F
	qrSRMSV/4lg98k144fo6jKXm6IWndWFv/d+c61BOA0F17XJebOaBNMT/8kbqYqNxkdhl8dJiDfdZu
	3j5FtVSeMCBVaGWqEyC00fi35pBzE+Rh+dt2MB/R7G8BOkh/frZ5iAJGPlkGxEDKq3NyA26f3E73m
	Zvgvngzd65vr5PPgVk/AMr0mr45L0P/30VqRAQJgP+eU2NP5lNsxjm6sBWZTflrpvqoCwfaptrsAk
	H9QVZRKSfqCFZgxtqYY76p6WBgGhmkBCM9Iq64ULaCE5HzBWP5zAqFbqB/bNX2dsusT6+8P4H887/
	OYiqqiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINz4-00000008e90-1qcu;
	Tue, 03 Dec 2024 08:10:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINtK-00000008cog-0hEL
	for ath11k@lists.infradead.org;
	Tue, 03 Dec 2024 08:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733213056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUnucm2fTy2CjmZdyCADxmI4mKYutrlWNpBYbKjw3IA=;
	b=CocK+nXNqNwyo2RQR+Q0uPW+J3JepyD//TQE36K4UNk69UIVSxCu8XBYpKsZB2DMXEMXkl
	EqA82jX3BqqfxeaKkD81DCqcmHPX6JAnEnVAaWbw/qFTqLKpJ4UxRiUzwlItsfLZbiUyZg
	wQ09JPLRyYEGHjUDhdu7+4wW+V5j4dQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-AYhAh3tjOcC4wCg3CCkrFg-1; Tue,
 03 Dec 2024 03:04:14 -0500
X-MC-Unique: AYhAh3tjOcC4wCg3CCkrFg-1
X-Mimecast-MFC-AGG-ID: AYhAh3tjOcC4wCg3CCkrFg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E6FD19560BC;
	Tue,  3 Dec 2024 08:04:13 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.136])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3C10E1956054;
	Tue,  3 Dec 2024 08:04:08 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_yuzha@quicinc.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	quic_cjhuang@quicinc.com,
	vbenes@redhat.com
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations are supported
Date: Tue,  3 Dec 2024 09:04:07 +0100
Message-ID: <20241203080407.100913-1-jtornosm@redhat.com>
In-Reply-To: <7ccd4b98-9557-4a8b-b493-e01b157c71e2@quicinc.com>
References: <7ccd4b98-9557-4a8b-b493-e01b157c71e2@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_000418_277130_2BB4171A 
X-CRM114-Status: UNSURE (   5.69  )
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

Sorry, but your solution is not working for me.
We need to be able to setup 2 APs, as it was possible before, and with your
interface combinations it is not possible either.
I was trying to create a second interface combination to recover the old
scenario as well, but I couldn't, that is the reason why I have implemented
this parameter.

Thanks

Best regards
Jose Ignacio


