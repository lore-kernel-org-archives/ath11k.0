Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CBBE7716B
	for <ath11k@archiver.kernel.org>; Wed,  4 Dec 2024 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqZFUty/mjDCNR25W6enLMiHQiV9Cyufu+nDyyZ+4M4=; b=J8mwsUCF1/1Gw97FtR3k7JgubZ
	Xx3XhmgTUqthqLh6JI3ig7UtUxKv0PPCdH2nIcVv97caU/2pbi3VTQGynb7xDK6ttyfsAqbSUwuBA
	QlBeI/vbhTt+9oycV7/dSGi5zG4dPV2MLyjbuqF74W5WJGHgOF3LXA1I2RMjBQb4neaUazV/FT/5S
	2ktedtQuie00rMyECfEOsUrUNr+K91QLMCOcsXr5ZkRUXiT+9GjklokODMWSR+WbOdLDFOlQG7t/g
	bGkbKcmX5hYVOwqHCFf02mARf1Uh1BhXw0uIOLC63LYrwjoN/Ecbj7ajUeFjDocMSjAJYx9gKPFgI
	A/P+bbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkAf-0000000Bn8d-2GBJ;
	Wed, 04 Dec 2024 07:51:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkAd-0000000Bn7d-0ZBm
	for ath11k@lists.infradead.org;
	Wed, 04 Dec 2024 07:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733298698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqZFUty/mjDCNR25W6enLMiHQiV9Cyufu+nDyyZ+4M4=;
	b=ejoa8v2p+BLIrR4l2bpVF3SHoIPl7/2rQLgAY6P3tkKpG2bakVWMEcamq2uiMZk0wjW1bF
	XmOnSoxejKzwCVnppkWSISVgnXbMm0SzBPl08roTz8t8MaNRS/U3VM0SXY4DxGfLwayJED
	PT1FJ5Nw2vBkHe6v+o+ccvlK5973GNE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-JLJmxmK_NBqgyCGoqfB5ZQ-1; Wed,
 04 Dec 2024 02:51:35 -0500
X-MC-Unique: JLJmxmK_NBqgyCGoqfB5ZQ-1
X-Mimecast-MFC-AGG-ID: JLJmxmK_NBqgyCGoqfB5ZQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C09D91956054;
	Wed,  4 Dec 2024 07:51:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.181])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 147CD3000199;
	Wed,  4 Dec 2024 07:51:29 +0000 (UTC)
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
Date: Wed,  4 Dec 2024 08:51:28 +0100
Message-ID: <20241204075128.5547-1-jtornosm@redhat.com>
In-Reply-To: <1b09c2c9-53bd-4960-b09c-7468f506b0a3@quicinc.com>
References: <1b09c2c9-53bd-4960-b09c-7468f506b0a3@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_235139_246007_E3261A97 
X-CRM114-Status: UNSURE (   9.33  )
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

> Pls try add interface with type __ap or directly use hostapd up the ap 
> interfaces that will re-type managed to ap.
This is what I am doing.

> f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces") update about 
> interface combination limits.
My patch by means of a parameter allows to come back to the original
interface combination (before f019f4dff2e4 and not the current one that
you comment), so as I commented, this is the interface combination that 
I am finally using to setup the two APs:
# iw list | grep -A4 "valid interface combinations:"
 	valid interface combinations:
 		 * #{ managed } <= 1, #{ AP, P2P-client, P2P-GO } <= 16, #{ P2P-device } <= 1,
 		   total <= 16, #channels <= 1, STA/AP BI must match, radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz }
 
 	HT Capability overrides:
And I repeat that with that, my setup is working (no error log).

> If chip support DBS, station interfaces max is 2 that why you can't up 
> the 3rd managed type interface. You better add interface with ap type.
Ok, but as I commented this is what I am doing.
Just to clarify, only with your proposed interface combination I am getting
problems with a 3rd managed type interface.

> 2.4GHz works fine also.
That is great.

Ok, at this point, as I need my setup, in order to allow me to debug and
get the differences, could you share how you are configuring the two APs to
test and debug here?

Thanks

Best regards
Jose Ignacio


