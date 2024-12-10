Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C96E7717F
	for <ath11k@archiver.kernel.org>; Tue, 10 Dec 2024 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvGth1QLNyFinm1dsOjrasK+ZrrCmJs8ywoSm1iafao=; b=QG+XQPsIEgvpfjmoNotBY7rxvO
	Tnn3wqx3ROIBMLaAvOKsBlPwPk9cnXXj4YWwegKHjgvuCVi43ySHlcEQ9bMIBjuybgF51LhX1b28t
	6a4E+Qv88CiMJZfXblHpwK9X9fU1VMQFp6fUsz5IivO2okdRefjF3j78abAjF+zHGU3geKuRw40ZB
	ODhbgIBH5ryKPtviuZmILQYq7XSBpykWC5iB6BBM7+XgwYdqJP3pLz1FWzt9+4rnL7hp72jzPX8vr
	DOCnzKbpR4IbIW4nv2XuJ1HxK7SvLQyDD7rB44qR2Xc9vtyBh/r89tjiCN6gV8xdGELCi21bbq5WP
	GurF+0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvs8-0000000Al4i-3CvN;
	Tue, 10 Dec 2024 08:45:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvr6-0000000AkmV-3vgy
	for ath11k@lists.infradead.org;
	Tue, 10 Dec 2024 08:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733820270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvGth1QLNyFinm1dsOjrasK+ZrrCmJs8ywoSm1iafao=;
	b=AGtXbCzRNyxI5m450HKEwPuKkzrFQEfrJawGwcUMISdZH11O6OycnZgdogr9Dd/WyWitQq
	WsPsSww8UMKRUlk/ofSAw62Eulbyh3PjNONUzSF1b4Q7TLlmyuWnKMFRusfelJFqs0VHQe
	8PmTrEDFrAjSSAsq+D+ghPicZMVbh0o=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-0M-iex6MM0ayGOvsxPLKug-1; Tue,
 10 Dec 2024 03:44:26 -0500
X-MC-Unique: 0M-iex6MM0ayGOvsxPLKug-1
X-Mimecast-MFC-AGG-ID: 0M-iex6MM0ayGOvsxPLKug
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E77B19560A1;
	Tue, 10 Dec 2024 08:44:24 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.222])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 05FE419560A2;
	Tue, 10 Dec 2024 08:44:20 +0000 (UTC)
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
Date: Tue, 10 Dec 2024 09:44:19 +0100
Message-ID: <20241210084419.126723-1-jtornosm@redhat.com>
In-Reply-To: <db61f998-2524-4623-8b0f-143661507e38@quicinc.com>
References: <db61f998-2524-4623-8b0f-143661507e38@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_004433_045710_1D5B99BF 
X-CRM114-Status: UNSURE (   8.33  )
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

> Yes, Can you pls share the complete steps and commands?
Sure, I offered it before.

You need NetworkManager and of course NetworkManager-wifi packages installed
and working.
We are using Fedora/rhel with the default configuration and you can configure,
before the next steps, the wifi interface as sta from NetworkManager or not
(with no wifi configuration the same result happens) because it is going to
be unmanaged.

After booting (wlp1s0 is the wifi interface for ath11k and there are no other
wifi cards in the system), here the necessary steps with our network
configuration:
# nmcli  device set wlp1s0 managed off
# ip link set wlp1s0 up
# ip link add name wifi_br0 type bridge
# ip addr add 192.168.254.1/24 dev wifi_br0
# ip link set wifi_br0 up
# iw dev wlp1s0 interface add wlp1s0_0 type __ap
# iw dev wlp1s0 interface add wlp1s0_1 type __ap
# systemd-run --unit hostapd1 hostapd -dd /tmp/hostapd1.conf
# systemd-run --unit hostapd2 hostapd -dd /tmp/hostapd2.conf
# dnsmasq \
    --pid-file=/tmp/dnsmasq_wireless.pid \
    --port=63 \
    --no-hosts \
    --interface=wifi_br0 \
    --bind-interfaces \
    --dhcp-range=192.168.254.2,192.168.254.205,60m \
    --dhcp-option=option:router,192.168.254.1 \
    --dhcp-leasefile=/var/lib/dnsmasq/hostapd.leases \
    --dhcp-lease-max=200

After booting I get the same issue just doing:
# nmcli  device set wlp1s0 managed off
# ip link set wlp1s0 up
And the step that you commented in a previous answer:
# iw dev wlp1s0 interface add wlp1s0_0 type __ap
# iw dev wlp1s0 interface add wlp1s0_1 type __ap
# hostapd hostapd1.conf &
# hostapd hostapd2.conf &

You can use whatever hostapd configuration (with the suitable interface name).

Thanks

Best regards
Jose Ignacio


