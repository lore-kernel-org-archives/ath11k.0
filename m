Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB36C87FCB
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70peFFMQuzBqbP1VfIvYgy7agiqxlCLmi9ehSeQESXE=; b=E/8NC6oKSN3WAbXPidLtH58XRD
	5E47WyITlslo8JICxPAevfVb/IXypzellpchXwxUVM0K7Uan1WyaI2UT2bPS8zF9N5qZ6AtwM5fyS
	5Ori0NYBaEIwqEW7MVxrlHKYGRUTKEFoC37jSo4VVB/ERr2aUytr3ixgwszfCuzh1eS6Xjs1UcrAm
	cB1xW1p+7Lx2RlWyDKXJB5DoVlEK9kfXGFfipl2PfsfVAVs4DJzXgqpn5XJonSvVpe5VnEK8wywqa
	SXvD/cREMJOBPM83CnVBkI8HdBo2M0jf6Mw9X6HxM0Rt+B7Xhe7YfSdj3BTv752axIigycTrs6d4t
	ja8Rus5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrm6-0000000BNgV-32r5;
	Tue, 12 Aug 2025 16:22:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloMX-0000000ApM3-2njy
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 12:44:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-459e1338565so50839545e9.2
        for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 05:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755002660; x=1755607460; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70peFFMQuzBqbP1VfIvYgy7agiqxlCLmi9ehSeQESXE=;
        b=QyKF16WwdSxDUxlnYhnqkbuLDxN0Q++B5oAQv9k0ldjEZT/akzqBjI7zxRqdSukXHT
         b4cs5gOu7yrn36ljK8CHu7ATnCp5+y91F0E1MZO2FZJK8kLdCIWWN5abDmBQgjAhf55U
         ARrAP8+ha/mR04XMjSx0KOutzYUZ/uMM6LvmI4loeBX7jiShFwb2WQ82ugzm0RD1BdBe
         JXdR8ACwbNoLoX8cTsBeXxrwwl6v6QGtifCBll9ZBY/LPMWx1CdMOcKZJKO1em9Lm/Vv
         UDNxrFtSSCQtJ6MV4/jvYB3OvCR7bPgbRN4vxgJ0ankzeGzUn2acjeGZza5aZXn1RyC3
         fIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002660; x=1755607460;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=70peFFMQuzBqbP1VfIvYgy7agiqxlCLmi9ehSeQESXE=;
        b=ddAlji1ulPpgyUZ9rFFWmAS6u/UVw17aeGwFBkqlOwuSXouSIh4h7SE9shPY2Gg1nh
         YNo0dv9mZ/j1DOkoF0lCqKZ/XPIdPcLLjNtSXLsyrGiCqCNobMMmLKj2IZFIcWnuIlnC
         fbIguhzB4g1OsnxLR4aDVMbW4NKiQGQ6RpC3Do20SASldrRXVN/emnQD+P8tEHvw5AVN
         wQ0lkw52gCu0BX2lckObMuTY2sm26afCruaQvnIv8UMWixXCOpbQfBdc2fu8yvQRXMBS
         sN08oPG2h0gKfWNsQBNJY+3mcxsYL+nONJfwXUcaF3cCZS0onR7UhIFEIV3IW/8ArYVw
         G1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmDL7d7PzjTVjwj436Yxf5lwS6FV2dqqk0RrMemHES/O+d7qiiqQCbIatt75SPRLP9t4UeuTk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNnZ1aBeQgY42jKguhKWGshxtyObYgl1k0rFJpDYHaa/uF/JqO
	2BADEpjjHOQsEVQSWiSwxbApJ2V3xUPwmXlLJYFWCc4BTz9LoGJ5QsVI
X-Gm-Gg: ASbGnctTO93806n6oF1s02LqeivPeHHlLwR5HW2SZjTcCj/NXJduH9rMT+JTCs9Scsv
	YsTKtqxThat6w+Oq5e7MEa4ab9C74QyNXF5w5kYDijjGYCASKMJFAgohpGSjBcNyFG7qo1pq8+h
	jSydXL00b7RDwG25PlI6K79uWFSGNQCCP1uMW6G2TxebalW+Fpl6SMg64Zx0mCaeOIN1dcZcQVZ
	e4jcmDj7PPEQmthumlENFzAG6vXj0vj5bttCCLjyT9zGZQbHMafLZgC77DIa0s9sMd8jOuRsjb9
	cC97o0FjZN53NqdUpqJdclN2dM+RYHzkIgkjxL7MLYdgvRKkAIBDWVd8hLFDsC8e/CsFIuAsuz5
	NphhmlPueWMIf9lwETpQtCLcgIBYlvQ+6ZUCUVkNS
X-Google-Smtp-Source: AGHT+IHp1dhYfOgtsbw2XkS84nVQxVPMzwExQGHqHjdIJUuDVXuWms8PWlAK8N/vsBpCMAFIC0Khig==
X-Received: by 2002:a05:6000:26c8:b0:3b7:7898:6df5 with SMTP id ffacd0b85a97d-3b900b4da22mr12230450f8f.14.1755002660012;
        Tue, 12 Aug 2025 05:44:20 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm45019771f8f.4.2025.08.12.05.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 05:44:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 14:44:19 +0200
Message-Id: <DC0GIRF0TYEL.DUG78V7F6HID@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Steffen Moser"
 <lists@steffen-moser.de>
Subject: Re: [PATCH] Revert "ath11k: clear the keys properly via
 DISABLE_KEY"
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 <ath11k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250117191455.3395145-1-nico.escande@gmail.com>
 <5b769b75-df2a-4dba-a41b-198851b61b9c@oss.qualcomm.com>
In-Reply-To: <5b769b75-df2a-4dba-a41b-198851b61b9c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_054421_727816_931C6681 
X-CRM114-Status: GOOD (  11.23  )
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

On Tue Aug 12, 2025 at 1:34 AM CEST, Jeff Johnson wrote:
> On 1/17/2025 11:14 AM, Nicolas Escande wrote:
>> This reverts commit 436a4e88659842a7cf634d7cc088c8f2cc94ebf5.
>>=20
>> This as been reported by multiple people [0] that with this commit,
>> broadcast packets were not being delivered after GTK exchange.
>> Qualcomm seems to have a similar patch [1] confirming the issue.
>>=20
>> [0] https://lore.kernel.org/linux-wireless/Z2Q9POuV-6MIdzRf@pilgrim/
>> [1] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blo=
b/win.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-t=
he-keys-properly-when-DISABLE_K.patch
>>=20
>> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
>> Reported-by: Steffen Moser <lists@steffen-moser.de>
>> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-b=
a7fcf20eabf@steffen-moser.de
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>> ---
>
> Can you please check if this alternative addresses the issue:
> [PATCH ath-current v4] wifi: ath11k: fix group data packet drops during r=
ekey
> https://msgid.link/20250810170018.1124014-1-rameshkumar.sundaram@oss.qual=
comm.com
>
> Any Tested-on/Tested-by tags would be appreciated!
>
> /jeff
Yes that was on my todo.
It seems to work fine with this patch.
Thanks for taking the time to fix this one

