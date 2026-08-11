Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8AEC5CFCF
	for <ath11k@archiver.kernel.org>; Tue, 11 Aug 2026 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlaxmCs+2BmBzsrKE46vcfXh8zF4HlemgralQUTmDsQ=; b=miGjJJ8LF4/tVX8JCZkJYiOxCh
	A8SfzAQkI5DbhHw0/KYsyiGKpXc6eSW3x8fBLhYq6SPg/t9oMmljG/wgi1URA9O0CGN8FS9icoZWp
	HHaiYyDxqwVmVTHmAI89oXWuha1ENyxdAGJ5tKteLqNTbffyv7GkXbv13am22orxacfYSpq6nXTDh
	P+DsuSLH7ekQH0I8lR7XsfcGB50ogBfvFy0geBEv0LL9/d5qb9xO64J8UTIzgmvxtLVMZeEVv2nXM
	WB0FJTuJe/p3nFeSMmO0DTt7AgYZOOh5iZptyKlqJtkSPMs6l5HzXjhb0Ko36xnJzGYifBZQM3VpT
	0unmcrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjwy-0000000Ds8a-3HHW;
	Tue, 11 Aug 2026 10:43:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjwv-0000000Ds7a-2TC7
	for ath11k@lists.infradead.org;
	Tue, 11 Aug 2026 10:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786444990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlaxmCs+2BmBzsrKE46vcfXh8zF4HlemgralQUTmDsQ=;
	b=CLNNBFH7gNQE+Jg9ywHlikAtzL+x2DfrbQOp45z2Yzof+1tVMgT9eHoj+Y0p0SXThY1r/t
	JWgwZHXOtmwBHSL8e9cq48KLrBAskWSd3edjoQvqrjs9ArdXZW5w6WEBT1n+a1fuK9MPgW
	+/Yq0kE3pV+T1LeOflEqtcvJyJJmhm4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-Fc0tHaWRNi-5iXcBc5NOOA-1; Tue,
 11 Aug 2026 06:43:01 -0400
X-MC-Unique: Fc0tHaWRNi-5iXcBc5NOOA-1
X-Mimecast-MFC-AGG-ID: Fc0tHaWRNi-5iXcBc5NOOA_1786444980
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1116A1800644;
	Tue, 11 Aug 2026 10:42:59 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.68])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2E1019560AB;
	Tue, 11 Aug 2026 10:42:54 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 3/4] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Tue, 11 Aug 2026 12:42:53 +0200
Message-ID: <20260811104253.394517-1-jtornosm@redhat.com>
In-Reply-To: <2774127a-01ce-4d26-b8fc-e68f49da2bbc@oss.qualcomm.com>
References: <2774127a-01ce-4d26-b8fc-e68f49da2bbc@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: i1E5l2AyXqaLe-fwgMPyDOO4oyV4kDSlQXm3oC2k7jQ_1786444980
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_034313_698997_084529CA 
X-CRM114-Status: UNSURE (   4.75  )
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

Thanks for the review, Jeff.

Ok, the if (!ar) check is unnecessary if hw->priv is always valid when hw
is valid.
I will fix this and add the Tested-on tag in v6.

Best regards
Jose Ignacio


