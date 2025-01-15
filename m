Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD99C02183
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxUWxCt7rcX0HrQOs3U5ych9ofEKteYsHZaooyka2pc=; b=ETUzrwRp63hrhVGE4n+swK0moQ
	tzpmQ+IYO030WZjWKZi+V424XMM9q+hD6iKn/YBG9N/533mHPiW3yllOIV17kgUYAAI2FAlgwjjix
	N45ouEypRqdSS4c4R+7CwGIDQfMdRcSiyvC6MICGsNf72bwvDAOd3PaxAzlgUNYqnSgBHZR2E1YkH
	5XfDngWW1G+xwUiTQQJZT0gQNB+M//UvDmqbkY54MNlYCIxlVIfICuqJopmmwzjgY0YKrikmOYY3G
	RLyjcO8et9FHkEAHhfBTZ90ArZqe9aBE0oU5p99U7EjyLgOVer8rLRvHYD50WsRytSM7IODO5td6n
	hWd8brYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzzE-0000000BOWX-3wAj;
	Wed, 15 Jan 2025 09:46:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzz4-0000000BOUX-3aav
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 09:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736934405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxUWxCt7rcX0HrQOs3U5ych9ofEKteYsHZaooyka2pc=;
	b=f/Ifb/Br40GbmkUU51vkx6VjRTjV9dmceWHL/ujAcRlXcR9MkCbVKdKGaiZo1uWSjL6wEZ
	3czNaUTDfoT4bq6p4ydaHvbiScxbqhbWxfq0nCWPzmW6wWlyjOOOAZbfUs+diDUDFaPjqJ
	vWL+itk+hOAf9hTQkgYAkEyC8FBvmLU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-A04rJFB3NHqB92hmB2wNAg-1; Wed,
 15 Jan 2025 04:46:43 -0500
X-MC-Unique: A04rJFB3NHqB92hmB2wNAg-1
X-Mimecast-MFC-AGG-ID: A04rJFB3NHqB92hmB2wNAg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08ABC1955D80;
	Wed, 15 Jan 2025 09:46:42 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.171])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 567BF30001BE;
	Wed, 15 Jan 2025 09:46:38 +0000 (UTC)
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
Date: Wed, 15 Jan 2025 10:46:36 +0100
Message-ID: <20250115094636.132250-1-jtornosm@redhat.com>
In-Reply-To: <52a3efe8-c550-4494-af63-6b8c6894e7b5@quicinc.com>
References: <52a3efe8-c550-4494-af63-6b8c6894e7b5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_014646_960925_AF933FC3 
X-CRM114-Status: UNSURE (   5.41  )
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

Hello Yuriy,

We can debug/configure NetworkManager on our own to get what we need.
Now, I am just trying to get a solution because at this moment 2APs can not
be configured as before.
As I commented, if you want to have a common interface combination, please
go ahead with yours, and then we can see.

Thanks

Best regards
Jose Ignacio


