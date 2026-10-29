Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B011606A31A
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 16:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WPa3kz5O;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VhCsyZZ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ukzCygZvukvs7xtNwXeIg6EW4nYVim1PfE4vJaFRyh4=; b=WPa3kz5OV9gcV7cfQdQ9id5a1C
	6mGtwOIEBNAkCDEv4+AlpRWbDJpgeYMMeHCDtOF6sjyKz5lMSMbq/zGLqIctIBHNj0fBH55GLfPWZ
	KN680QvxdGT8/rDL5S/fGOY8DOG+wqp53Zee3jOUrO0EHRsSQDPtiZRKoNc79ojMQbWz5W+jI22k3
	qFE37sHG+WsepSVPHyOO8fbk67xVUHbF75IMMiHd/gDsVpKl214sb5gLse32JRy5/fFlxmzysg/SP
	xq5sm97n5YeUwCAXwgZPIPVODFRp04LnJMpiXlv7bgs1knwSdKBMA83Mx0RRrUpah3EVu6VJRuObu
	jDfhNPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTEn-00000009rCZ-0Cxa;
	Thu, 29 Oct 2026 16:44:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTEj-00000009rBT-453S
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 16:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793292260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukzCygZvukvs7xtNwXeIg6EW4nYVim1PfE4vJaFRyh4=;
	b=VhCsyZZ1lnwbwtgOXZMmZ08EmAFnxGSzIhuiLsTScsTRj5yc/U1MHrh4XuwC2bMidWcSOa
	DUzzYCLXGHR9Htkkpl8DpualneKUbLG9q90AgOKEEIl6lvYEbgwXU1aaEvSGwcmWXAiq+h
	QYtNkmu8LvqS8neN6q+aJTpFUyoFdfU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-2S1eWF6uO1-heGXZBdtGng-1; Thu,
 29 Oct 2026 12:44:10 -0400
X-MC-Unique: 2S1eWF6uO1-heGXZBdtGng-1
X-Mimecast-MFC-AGG-ID: 2S1eWF6uO1-heGXZBdtGng_1793292247
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C6BF195FE10;
	Thu, 29 Oct 2026 16:44:07 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 704E41955F01;
	Thu, 29 Oct 2026 16:44:03 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	skolothumtho@nvidia.com,
	yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Thu, 29 Oct 2026 17:44:02 +0100
Message-ID: <20261029164402.1366695-1-jtornosm@redhat.com>
In-Reply-To: <20261014150047.GO14213@ziepe.ca>
References: <20261014150047.GO14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: rfm5f1DCz6GqaBhV_gicwvbJr3p0F-sNR-Hp67KTfjU_1793292247
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_094422_096129_2AC7D84F 
X-CRM114-Status: UNSURE (   4.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

I have studied your analysis and tried to follow your guidelines
for the KVM paravirtualization approach.
You can find the proposal in v3:
https://lore.kernel.org/all/20261029163713.1366077-1-jtornosm@redhat.com/T/#t

Thanks

Best regards
Jose Ignacio


