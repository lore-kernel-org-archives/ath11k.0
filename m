Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD52C001B2
	for <ath11k@archiver.kernel.org>; Wed, 14 Dec 2022 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2G5vUzoHuq3TEZvSQKjCm3HI8nwhlWD2c5rUthr2Cqc=; b=M2S
	H3K7J6iuSmNacMeGTyBMLFeWUXjXrSvOqqt+ELC8sOD85xfvkIPeR1ggh/D/EjfiKum5HkmAPPalO
	b4Z8MYIBgoV9HWXA92s+tcBFfqZmUqQ3czidkfAMEB5Cho/afp4HH3kDIlnS7uHGBD+zdDw4s0Qga
	g2Og0cjFPWPUpgTF9hFvjCVruaLH08uZuOlmi+nnJj00A+q2dmrJJ2DUejMJwuk4CUyEFfv3Re0bw
	V0nFs7MEsfFWfcQ3SiC58vJxajobPCZHT6pNuTrryZNbcPlOqlfxB4IKDsMflo1e/WGsFK0czIpf6
	HgNuqnbmoFnR4qtNU57H8NCwC1JsonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5PMQ-00FjBw-O2; Wed, 14 Dec 2022 10:51:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5PMO-00Fj8a-BL
	for ath11k@lists.infradead.org; Wed, 14 Dec 2022 10:51:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d7so2907753pll.9
        for <ath11k@lists.infradead.org>; Wed, 14 Dec 2022 02:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pXFfFWLMzTtdZ8aVK7PgkVqaBc6BkTSOWyKJLBpx5zI=;
        b=JFnB3bplp5aCVXrbHL/nDdvW2PktLQdRabVCvBuOTXQe7wj9jcCpm6XWMdBfVqm3K7
         ejaGFqCncY0gZkclb7q17U89w82syzvfp5h5zmajmt+k2msDsE6C4BMaGLYa7Y3qn7Kz
         cnFJ85VPKIkgsfLDsxrgUwPcxKstPZmUdovy7JCIdPWBOI0a5c95fcqfZKd+x3zKnoYe
         0WjfoCTRhActVoQHbSVbfcEc93OtkxmzoE1lhOK9LU60O0qQOJIdNSXMesZMYbKWf9/6
         kOjHsBcge0RVLWbhE2jxZzyLUAkPexSffeJWxNftZw7C/EKsVqj04/E1ZdyKU/bka5jG
         f9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXFfFWLMzTtdZ8aVK7PgkVqaBc6BkTSOWyKJLBpx5zI=;
        b=ABaDeKHjys/x9fJHjxmBHPlCnpaiTAZ+GOQO+Rgoe1bDQw/uWF3pjKMOSDF7+19pWn
         iH9UQKqAxWqDUUfXdGk2sv+HDd1qVcem6ZHxirdj/ltVaEYT63ESL5rYrZpvXpCYtP3G
         h1abIVOo0DGHyc9VldHlRk1a7WgJSJRuDVfn3lGKGgtIlTWHOGkJdOPZptEO1RcyBRkI
         wRdLMKgPnWPy96BmmF+wMrQqXm6YJszJUwsFCzgU3gHSXdkH/tDkdrSFE7xk/QnBMVdB
         iDnp/iFaZj2iUHRQt4+uYNLJ8ZtPrk4E4h1A2MEzKWGUMNJB32lhoFLjhN6jvnOyrQyh
         hFLw==
X-Gm-Message-State: ANoB5pleeUWoIiliIRnAdJKmVi3PJHDWIhdElYm+bsgLd7bLvMnWHetZ
	JxT0IQy3DUcWc/yCAZJ1qmMsPZRxtld4zZyJCyBagXvl
X-Google-Smtp-Source: AA0mqf7KwmlcGunhbjKXm5s15hLjIMAuFa96nuIWWoJjlNAPVBrKA5yuj0nLDIdVsdPfQXh0t1iEsSj4fAJjK9fmFiY=
X-Received: by 2002:a17:902:9307:b0:189:9284:2140 with SMTP id
 bc7-20020a170902930700b0018992842140mr48926556plb.111.1671015093860; Wed, 14
 Dec 2022 02:51:33 -0800 (PST)
MIME-Version: 1.0
From: Robert Marko <robimarko@gmail.com>
Date: Wed, 14 Dec 2022 11:51:22 +0100
Message-ID: <CAOX2RU5ATBuuPewx4DgveKjhc+E1a=Kt2COWDhYqQtLiJ1=NoQ@mail.gmail.com>
Subject: regdb.bin availability
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_025136_407679_9CF8568B 
X-CRM114-Status: UNSURE (   3.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,
Would it be possible to make the regdb.bin publicly available?

Newer FW-s support using it as the external regulatory database and it
would really
allow the community running AHB radios to avoid being stuck with the outdated or
even non-existent regulatory data in the BDF.

Regards,
Robert

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
