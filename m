Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34321CCD183
	for <ath11k@archiver.kernel.org>; Tue, 14 Oct 2025 02:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4q525Voze3wyxvp3zK+z1Kmg/x/7tuuBb3sZHwyZO6U=; b=skFsRIYL/TwQeQhlhD0GN0fkJL
	47YKURh+1q6TfKoyZMI3tv7QMZm2F1aV2+HOU2DZIM2+Nt1M0+unLWI9nPDWDavq4SBrkMozJZnrl
	YbEe65iyeidU1k+tYrUkqu/F8u3PLvaFpbf/TXnxLnf18jPjOTm3MdijdPiG6wUA+yEFe/PzKGfW1
	RmxKhZ51KgnuR8SNbwt6KdDvp7hv/16noyJz07EzzBK7UjXUvRTqZ++rbE9YooayLfT7si6IBDVBu
	AtliU2RFlf7o3QfhKVcjzE+WkmRtqzYxnkRDy3WQED9LwKuBVMxVueWBVacUsorKwo012D8LmYgod
	vLomqxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UWs-0000000ExLw-3g8h;
	Tue, 14 Oct 2025 02:12:46 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UWq-0000000ExLR-3SMX
	for ath11k@lists.infradead.org;
	Tue, 14 Oct 2025 02:12:46 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-635fde9cd06so4957880d50.0
        for <ath11k@lists.infradead.org>; Mon, 13 Oct 2025 19:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760407963; x=1761012763; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4q525Voze3wyxvp3zK+z1Kmg/x/7tuuBb3sZHwyZO6U=;
        b=W2QqmKGhjdHDRukwYYDXflcdKexMEC2DMd2c9cKznSDBEQdFiKv6CJlyxu/zdRzYYr
         4HhsMtD49e6t45hR+q6gXHoiekNLNm3b4o2muUX22AiGe4IBEaw5bN2irEcvapaDFqUV
         36bVDhBWqqorL3bXOSnH5NjR1zaFZsa2X6Kh78HUSBlmhzFkD3h+Gc1uwQPg1l1+o1Y0
         Lt7Bb1zct1SmtxSBNIIiQwWlEFJ99xrgKH9NPiU8FlN+81K33w06sZ7JfrdX2mu9x2Bk
         DLFQqRvauDhpsmaB85loJczvOLpnsGL3Rx9jUzwCxi5Qr1Z99QrSQ7LsyUs0vsfi+Frq
         zqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760407963; x=1761012763;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4q525Voze3wyxvp3zK+z1Kmg/x/7tuuBb3sZHwyZO6U=;
        b=o4b0QvYq5uFQQluclAFaLpkHr8N5+hrB2M4HEPhMZaoE2cfJ+Geous21qDo4gpAOsK
         TUs0lTWKPsl8UJQroErqTeMG4SsHeLWTkGB+ROKn5qyD7dDcjnP8IfnLgd0IxzxkI+In
         QPzL5+3A+WqAQGhZ7HiUFYJUKM9Oa17q1k7yitiIzS/EEeJs0KF1LiaKbTy+6APu3HfV
         jYQQwnaPYpOHV79e7yQdOnMbrMhR2dJsJl1qrECb1BdP114f/9FuiPd6+0TCYSq5hCFj
         pN0diqYpoSkOyAJp1XKMmLQvz272B0pyspZ76WB0YU3VojOY85f+VVZM88GQH+AH9EgX
         b6cQ==
X-Gm-Message-State: AOJu0YyG5qT/3XcDu3RPDLftLbzJzyxvCRcCAAMG8qK4iZ2yprhtcrnf
	mwBmhAwQUw5VUJ0wlu2L5/jHIXS4lS548lazzNIxO3iuOPLIMXb+yllRv3dZ4LkRhwu5cldwdZk
	H7pQRJdfEm/Vv40P8UR0cueH5CvV/Qd7PLMkU
X-Gm-Gg: ASbGncvy1XzSyr31TX/HJxWligNatKppmqZAoIB9YW0zHvj3ywfOf4z/P8EFAsVAJ0M
	D3QvMrN/sk/qMQrppcjx+//YaSb/nRJEnvVUKIXbgVLd6GjgDQhMJcMd3THswLk9pQxVkRq613Y
	5rmZbV/41KIlJd6K84/y0RHRJI96Fxdwx0ljfMQ3xBpsavhkOgu1znC6hRlUkQSH9tOM05i236p
	U/Cuq8hPIl1raCzQy2IbhJUBw==
X-Google-Smtp-Source: AGHT+IGUny/RYZTzUgBXBGtj9eci+/7XGANOqs6PVZA1pVt1WlQ1V2rmNfUylAeh8CNrKe53sAvmO9wcaBsvI9Bl/ic=
X-Received: by 2002:a05:690e:4292:20b0:63c:f5a7:3d3 with SMTP id
 956f58d0204a3-63cf5a7073emr6993081d50.63.1760407963222; Mon, 13 Oct 2025
 19:12:43 -0700 (PDT)
MIME-Version: 1.0
From: Doug Brewer <brewer.doug@gmail.com>
Date: Tue, 14 Oct 2025 10:12:31 +0800
X-Gm-Features: AS18NWCmp_6fK9kPsfrfZ8-UIuaxE4_rpNUKIRY6sD0juA1QUp_-GN4HfgKADi0
Message-ID: <CAG0V13SM5VN6sfr_iMFBSHHOLFbW8-WK3=B-vt9qgE5nu0CmaQ@mail.gmail.com>
Subject: QCN9074 load board data file failed
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_191244_886924_38F2FC00 
X-CRM114-Status: UNSURE (   4.72  )
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

Hello,

I=E2=80=99m currently running Linux kernel 6.17.2 on arm64 and testing the =
QCN9074,
but it fails to start up.  It seems the issue is related to loading
the board data:

ath11k_pci 0001:11:00.0: BAR 0 [mem 0xf2400000-0xf25fffff 64bit]: assigned
ath11k_pci 0001:11:00.0: enabling device (0000 -> 0002)
ath11k_pci 0001:11:00.0: MSI vectors: 16
ath11k_pci 0001:11:00.0: qcn9074 hw1.0
ath11k_pci 0001:11:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff
soc_id 0xffffffff
ath11k_pci 0001:11:00.0: fw_version 0x2403072e fw_build_timestamp
2021-06-06 23:27 fw_build_id
ath11k_pci 0001:11:00.0: qmi failed to load CAL data
file:cal-pci-0001:11:00.0.bin
ath11k_pci 0001:11:00.0: failed to load board data file: -2

Is there any known solution for this?
The firmware is
from:https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwar=
e.git/tree
/ath11k/QCN9074

Regards,
Dave

