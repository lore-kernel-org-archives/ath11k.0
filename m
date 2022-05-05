Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26776C433F5
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:To:Subject:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ECEOONm/s2il1kqff9PdHKPkjvyH65DmeNf1RI86uiE=; b=VW+pddrCbNYZC1
	xI1wacbaGF4lOtSITcm/ZWiYicN1CxLqIpH2SO0Z/VSyAhz2/3pxfzwQRXjptXErrna7r0yoZ1j17
	PzaaMH3PNDkfz2jyfsUyqaUSd4JDOFLv6qXWMaapgskPPJz52lN9ChvgNYvnJfRnhiOPNS8azcly8
	elVHlI+sv+18UVjrG1Sgop7d9J2nKUQjAb87Putqn9r0tfZMqb24h+cZ92XSzrA+ZBF8jNz4qBcqa
	7GsJKzm14tIkM09S9WE0IOklLeMuwwNvT1lKQ/vX1ssMxIY+GUACrNT392AfJ7Bo0gQuiVx6s4CuF
	lFQ8+cbC10W5cZ97xaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmcT4-00GNic-9F; Thu, 05 May 2022 14:28:34 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmcT1-00GNhY-KM
 for ath11k@lists.infradead.org; Thu, 05 May 2022 14:28:32 +0000
Received: by mail-ej1-x62a.google.com with SMTP id z2so7502249ejj.3
 for <ath11k@lists.infradead.org>; Thu, 05 May 2022 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:message-id:mime-version;
 bh=DEohO+aR3IPxb6NLn0tw09JUQGFTCVTyFN44a9POKsc=;
 b=csIBZ/CBnLIKcdat63JHg1fukpzUYwM+KlnBieyF3IcUt2vygY2L7DVF9a6kNapqjb
 0Bs+NzNuZYlho5psFP2sSwNmzLURFNF5DMfqOg2FXiMuhJwgELsjeazRSa0eJ3dmUgQp
 ZbpTfIB3FnKWLpuaLUIqqVH5caCpsGAJ2WgjCBmT8lnEQeEPNks4VI/cOFP4ZbTi1Kix
 tUturp+BuOPF3QeBRe++5FqcabXZOtFIJDBH7nrZKYaZfxYXuVodcPlHaVkAriSxiSDO
 cvWfwctYC2zSJrBfZDqK6cVmif0QZsgdC2tcbq37MLXvGJ8ncK8MriKDPHKdzao17F4g
 WZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
 bh=DEohO+aR3IPxb6NLn0tw09JUQGFTCVTyFN44a9POKsc=;
 b=gwjuJUzaznZv7wKfflk60rAF4gC5df0evDBiZfWUqZaBRHto900AiNI9dMdmrzTCVw
 aqJym0IRdnRNo2V9fDO3S3Y8HYnRCIHPnrnJfwJ9HopWwChrLliX9R5kAfzrJdYJzgpE
 CT35G3z2RDCFEnDD2p8vvCKphZkX8oQO+FupQTfyI1u+xN7kdPA+iQU9D3a3zF7GraS8
 bQbMA+sfMR+E+dlziqNfSO7u3N5vsJ/0vvFWloLQbvYhJzaDVyIF/bUsqHHaZIhsQjPX
 eJOZgJmqiJdv6kxzVC/AwE4OxAZd9/Ahs3HdD4DT0vXRS7WHqap+3o7PItFCjP/UDFic
 bCGg==
X-Gm-Message-State: AOAM531EwKWYTTwHjBF8GjPEKpEymj0wgBMw5pzY12TiaASxcN2D22wu
 kMt4oXj/yfNYWK2EjYuJuXOyZrMgBZaA8A==
X-Google-Smtp-Source: ABdhPJwDm/LnmuqveoV0it0yjI0Gfu3DsJ6VR/aOlragVStyhVvy3DzEN71yzfhPZno23saaZGYhMw==
X-Received: by 2002:a17:907:6d93:b0:6f4:f84e:8cf1 with SMTP id
 sb19-20020a1709076d9300b006f4f84e8cf1mr3137123ejc.555.1651760907849; 
 Thu, 05 May 2022 07:28:27 -0700 (PDT)
Received: from [192.168.193.144] (188-167-140-93.dynamic.chello.sk.
 [188.167.140.93]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e52sm805898ejc.184.2022.05.05.07.28.25
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 07:28:26 -0700 (PDT)
Date: Thu, 05 May 2022 16:28:18 +0200
From: Wim Van Boven <wimvanboven@gmail.com>
Subject: support for WCN6855 liteon subsystem device 11ad:a82d
To: ath11k <ath11k@lists.infradead.org>
Message-Id: <6VYEBR.N4O0Q6H2MTME3@gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_072831_736153_4CA8C799 
X-CRM114-Status: UNSURE (   7.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

the firmware doesn't have the board information for this 
subsystem-device:

02:00.0 Network controller [0280]: Qualcomm Atheros QCNFA765 
[17cb:1103] (rev 01)
 Subsystem: Lite-On Communications Inc Device [11ad:a82d]

however, it seems to work fine with this one:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9409,qmi-chip-id=18,qmi-board-id=255m

i hexedited the board-2.bin and swapped out the vendor and device 
identifiers to match the LiteOn ones, which seems to work properly, but 
is likely not the proper way to do this.

what would be the proper way to get support for this device and how can 
i help?

wim.



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
