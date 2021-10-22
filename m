Return-Path: <SRS0=5A3f=PK=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A481C433F5
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 15:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 388BF6112D
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 15:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 388BF6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sartura.hr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rAMSTKvZhLSB9iLh3BnN6l1aXxfshiZe3jmi2viug0A=; b=fmS
	AlX7V1bws2+1Zs5yx0Jg9+SAoWuR3BBc97zJkfaug5P77PVv7z9RM0TR+X3+vGO12eKthNoaCw3hQ
	XAx+ENvJJMVxUvSJuD6aUHlzad0eLoXhG0NmgUp7gk4jcCr06yzohI2fOJMrykf10z40MdyP8Niok
	CThVlb8DoqE/kVhSIiDNlmFrrG6IDaP2fV+5zWVkcuc566L9vbb/ha3jE2mZzr6yN+613zfa2fiV+
	/drsNyr6fP1NcJcEbDET6AWwHHfmh/9VOboox9Hl7Fpmf/dUU/Kn8KFcL5rQNrwBFop3zNYtUIUuG
	tEipbwEuZtxW5glVdqSvTdB9MdBEmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdwP4-00BPOF-ET; Fri, 22 Oct 2021 15:24:18 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdwP1-00BPMT-PW
 for ath11k@lists.infradead.org; Fri, 22 Oct 2021 15:24:17 +0000
Received: by mail-io1-xd32.google.com with SMTP id e144so5854352iof.3
 for <ath11k@lists.infradead.org>; Fri, 22 Oct 2021 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=tHW5Oz4b68RnSJWzb+1p8QuQFNhDmjxyZbeqt22dsW0=;
 b=Bb6X0pfJFXaX0RKeI37nbUNMoOfGLtMwEHf8v7kGYvmqDireSXA/O1wQdxOJUzfxb1
 /ZcMyR9Q51xSM3VA15y8zOIXJGQb25FEE9MMdj93sDFvUt83z4BzUHHs/osuSfBkqmf+
 yTe81u8qJC00xSvdvz3oPaTU+66UXRBJTmNMjVcbmXymkagstCk95ue4gCocAsFStoFB
 3cLKj3ZG5VQUySkGZSBcv5e65XyHX8h4bLVF/4BzKj5iFWjVvgEFcasOahYkWMlI/CN8
 sR4UokDAvBa1cW3dHeluudr6/vUY9r76cRe1SU+Wkgwtdc7sd8aviZvFvIkd+8Yh1xUj
 JYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tHW5Oz4b68RnSJWzb+1p8QuQFNhDmjxyZbeqt22dsW0=;
 b=VDli0kzmH4TomWQdbjcJYMwzTuoVqM2kjflQgGzB3oEMxAwSU23VPbyVacfPRf215b
 VTZlja72jpNc2gZEW7+1fP8LQhoqWDZXYoEUByscYpHPemnlGlCZcF4wYNtOjUZXtV2d
 v+yeW5NC9xnjv1sej5EAuiTMJI8nPf+7F6I0tNQjK+uZG01+/OEHcwikcchZ9JtK1STt
 neVPQCxJlCclYNk5l8Qxo9Ozw5q+41XeJnONUv7H5K8EH1XZxXd2Nma7u6XVfPqLgSMA
 OKNw58JOUnWfdPlfWIRmRdFxt/66yjBjShW1caZKVv1SzgRBGM2UHDb+34l/rvY9KxEz
 GT0Q==
X-Gm-Message-State: AOAM530xJbv6u5+eySeWpXHUiW6i3Amkj9FyrlGMQKWGvdNHHQ8y/pnV
 BOuDfV+ewKkVJEzo4JYDycjiDycvSQwjVEmQ/Sg1eE7oSoI=
X-Google-Smtp-Source: ABdhPJza87eAUmb/Zs+TbMwWvNUs6/pMDgAA/sC35PANyhjyMuxSdCQBQ76hEB0xyjei7Z+vNecRKNzCxVHWTkHYyy4=
X-Received: by 2002:a02:c901:: with SMTP id t1mr349255jao.132.1634916253634;
 Fri, 22 Oct 2021 08:24:13 -0700 (PDT)
MIME-Version: 1.0
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 22 Oct 2021 17:24:02 +0200
Message-ID: <CA+HBbNFszCNvPAuJF06bh6p0T_7VfxQXnuZGJEbpGLknvSFezA@mail.gmail.com>
Subject: ath11k regulatory information
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_082415_896255_56FE5542 
X-CRM114-Status: UNSURE (   7.83  )
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

Hi,

I have been working on OpenWrt IPQ807x support for a while now.
But now we are having issues with the ath11k regulatory information,
it seems to be completely incorrect for ETSI countries.
For example, it disables channels 12 and 13 for 2.4GHz and puts a lot of
restrictions on 5GHz as well that are not based on recent regulatory
information.

To me, it seems like the ath11k firmware has embedded regulatory information?
Is that correct and if so how can somebody update it as it is
completely out of date
even with the 2.5.0.1 firmware?

Regards,
Robert
--
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
