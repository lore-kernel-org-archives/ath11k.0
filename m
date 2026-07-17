Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13FCC4450F
	for <ath11k@archiver.kernel.org>; Fri, 17 Jul 2026 06:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=; b=u49G8J+k9lox1cAzCAB8XWKFWY
	VAnhNJpRvt5r34UQZlLpdBBUkujfSdVfawtg8IPdxjowb/5sf9Dg2r20wLJvybXnkCmhxyXqVqkqL
	J1ll6cVJ5gQ47k1BO1ub9WxFcD140JAT8RqVDaPevtpopnqEIDtKMTghpRyNjhYPPN8dckVkBV9jf
	tsJ89GJrHNoYE6IfdBh9sCkQEr3iqH8BXKolw/WtNb/6fCefN4f22LP6EYTP4N9iNm7SmzoXgj98k
	3gt/zKZwkNINk65Wdqy4FcUus+lyoroHTtoB/6pkB1oYZ3qi/eMxDISzHxp5JXsAaUecb6LtCWOBi
	glGztJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbt8-00000001FNM-3MzR;
	Fri, 17 Jul 2026 06:17:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbt7-00000001FMg-1MoS
	for ath11k@bombadil.infradead.org;
	Fri, 17 Jul 2026 06:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=; b=O35bscv4P97SvK6vfc50KxX72U
	PK9flv64ygK2cAEqND07Jy5+Fa8Ggx0MWmBUoTkugAphnuYslZiNxkYv2zgurOO5mlLK+sMiDxgAR
	jbARmipf6mLVLEUt65lX0pHL9GftykZZh31hEZdg3ttciAmq2e4S7DGdGM+9fWsnXIQJP4Hqz1qW9
	akzzkk6BvLlSp5s+re2zWKAS4io/Hmbmi/bDCsQvjjvywA8Dz+HLgq15TnWMsY72aPARolapOUotq
	7fL4MAsMoRnxUXGQlhp5CTo8pxMhRHv+BYKz4qhMvWB64y7V5GhhdwHVl1BX32mwbIteWtLAbtPNa
	i9vTt9nA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkbsw-0000000EYnq-49nx
	for ath11k@lists.infradead.org;
	Fri, 17 Jul 2026 06:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784269039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=;
	b=hM+cyRtfek2LSgZ1XQspq6jnsUt5mJJrzL+YIYJBtn9XwNxXRN3q3V4nm7tQWGlHnXmBsX
	ZUcz0LpKRVNGLoD3Plg/PYbD+8ErHGIBQvwW4Tr84bF2ryfS3jNgl6nbCiugpHJORGiTVX
	RmWCoruPB33LOVzXKdl6asAD/28jPi8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784269040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=;
	b=A26ER77+Pr8OxHKJk9uaXJyLkBZkGSB6iP4BwdZyH1P17qRyafMt2akLHZxQxODcoCQBDx
	Fy9vMrMLMPzALjsIDTCXAkvJGjrl33ob/B7ui5CLyW6AoUBa1NEu4Ks2sfXyhAKsFFWR8P
	scQs4SFQqFaQ/TvUseIz2RNgl+NyKPo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-JXrbyaWgPPSASAlVLQ0sLg-1; Fri,
 17 Jul 2026 02:17:15 -0400
X-MC-Unique: JXrbyaWgPPSASAlVLQ0sLg-1
X-Mimecast-MFC-AGG-ID: JXrbyaWgPPSASAlVLQ0sLg_1784269034
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF87518007EE;
	Fri, 17 Jul 2026 06:17:13 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.53])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0605819560A3;
	Fri, 17 Jul 2026 06:17:09 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 2/3] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Fri, 17 Jul 2026 08:17:08 +0200
Message-ID: <20260717061708.327038-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKbcQYvMMRUmVgv+GyG8eNiot0acJ13Xy2236zqqr2cnXw@mail.gmail.com>
References: <CABkEBKbcQYvMMRUmVgv+GyG8eNiot0acJ13Xy2236zqqr2cnXw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: NryDDJ2s2xX7IlUX1fsp0lLXc-4f_rkVDfpndvS5owo_1784269034
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_071723_266251_2BD609F0 
X-CRM114-Status: UNSURE (   3.83  )
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

Hi Tamizh,

Thank you for the review. You are right, I will fix this in v3.

Best regards,
Jose Ignacio


