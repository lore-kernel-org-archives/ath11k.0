Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A1606A31C
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 05:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dcQyCJ76;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRTsNMzA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=; b=dcQyCJ76WID+6KDOVTgxxit1AJ
	xKg/O+KQP/7vd2UF5hNP9qOcfGSTMX1WPkcOaa9VRkbZlPONPsilX8xlr8J8uYJoFO8bq7LxQCXJl
	kZibuQtkMACjLbcEnylYQ/19nHv6Xj/NGjyCpADaCIiqW+4apvfm6JdsJBYuZC++nwNthU7DkBo5p
	NdLjwiBnKbjtUva5MsdpM0GDYfJtBYa/9hVlB4J9DfF7uyh+hjgVO30/koG1WFxN7owtumYqxXdca
	fARvDZ1RERhtYUGm+FEm2dmLX4L5vJ9dThZ1HkBhwl4EaM+eWDWvQa35L2J1W64i139kWmpFljXku
	pxw09b4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAbl-00000000OG8-3StG;
	Sat, 28 Nov 2026 05:04:21 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAbi-00000000OFp-1uWm
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 05:04:20 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3866a784546so12130401eec.0
        for <ath11k@lists.infradead.org>; Fri, 27 Nov 2026 21:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795842257; cv=none;
        d=google.com; s=arc-20260327;
        b=ZAv5kzHH+OsAb2TR2p59mDdDt/PRYX1aypB7k0MRhnX+DAScQeu9PDh348pYorxJwQ
         grL2O9nhP1J0Lh6Lg4aDRzU0UEZRp5YZRfTsnFBPc3I2+8WwssZqXFAvXptmXt6RbDsN
         3oVOKGOx4Qor7dHLXIsTwTgn5GkILutOonklb6sAmVn+TA/briFeStDoHpcq/vEMYIme
         PTib3QDn9AkGMsY9KoafzbQTZe/AXZlf8kZbw2FstVotG53zienD1BClKlqqsf+JCUa8
         O91dWQxwx57UgH824Ee1/1i7z7u8SjkYz6yFCpR9Fq+D9f5OFkitqaYcHrVBUhxHQKY6
         T4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=;
        fh=okR8Gk4VuEknUMlADZCd3ZIVH/bCwejhN5E10vCCqR8=;
        b=JjJCEEfu9zy2tC0ZXKp0GnxMmZsUvTiM4uFqRnD76jf6pXvKiBs//qWjZJelXzlKii
         O90x9m4drOIdwQWOcoAEvAb5q1faE60cFoGRmBc+swxOtiLbyCQlxRyHvwdToHlWeVkd
         CgYe6ID8dqknXKQ0qA1r5fuUrktz6L9YvLMrvTIKemZQWQtO5rCfQnm/r6DA0Pacwhmc
         tX+zaA9SL6/5xTEcWb+k41X75XHK+9AYU3zY9EcWg4YWiX8WC5AYqKm+GkdKv0xOfvHE
         xzUsFiGmaS4IY1yiRrv0rr7b7JW+oP2ibISZ4o8oytJ8MwboXlEx/PEos/Eia4UHrhY5
         SD3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795842257; x=1796447057; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=;
        b=kRTsNMzAOy0Ch0WIP5QpyCD85cilL5MMwFi4+uBfemjxq62zEtE0cFbI/pZrfD/aI2
         6IWIjY/xxSr1GXcuCLvkk5dA7/WSSaGzVIMJghRkNNXrYhLemCmReiSLIFgphLT9ueyf
         MNimG7klKawgRTaDZYOzBt4/NPpaqfuG58j0QouIz9K3/OLMz0T1JiNrulnV0K5lrMMO
         YwtPyJdstRz3yixXpWvee3YnFte3uHWttp4idBWkufvlle6qy4c2IGjcSeHBkbbXehjM
         QSdBfCeXKbs4n7Corn4AtWgUV1I8pOpcqh0M9/7N81MAfh3cVEQ1dOwN+K0HUc7ASlQH
         dWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795842257; x=1796447057;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=;
        b=KGmf3hWvyLKCK4wz6OAf4qY1rrwc6v8BQKFqn/xpC6cdY7m2F1yIDg+LOCE1YNsrwz
         h4NwTTI2KoA3JgDpRhr2o68rYhldTwneamOZY+rUbuhnIYvGFEr0HY+ofLVrE2FKXjMQ
         pwWt1P9nOIBxMrr2TT30JmHrO2Z0HR/TMR80A+Ris0ha4r39/X9yXJSe248++uRW5PYf
         Gte7s/2O0gqdDlx51E+gy4Hu4aWvS238JMETUUmZhn4nOtcpY2DD9DJqwtAnF4/xTCsp
         ed20LZoScfN4IAiyvCXeqpS/5UhiWHwa0phSqps71+w3C2tCBDqc23ntJCHTJLnhQAUK
         U42Q==
X-Forwarded-Encrypted: i=1; AL+hErHEMqPTQCErrQkxbH8af/Guz2PjCAclwtCZmHF8dgO3/uENqH1R71DZ/zKvqW6wroBAKxR1N0o=@lists.infradead.org
X-Gm-Message-State: APuU4Z8FWKufwC4EoIqMOeSGHLK02dyxHTvz154wOS3GT1jGz91GBPoP
	+deGT5mJj5WjqjI5LUvgD3l6NxAaIa+SqPugHMNj2i0UICLxuGS/rgxGUrspimROaMc2zvJeejj
	ogBkI0GXfaO5aFl3+OX0JvaDZHxMheDriN6+4
X-Gm-Gg: AZFdTZeHY9qM67oKZ1A9y5t4OlqmpftqgCZGSwXQAgtnMb9oyDVN0UeKnBnicWgkq3M
	JKc49NNNyVObgtbxP4OH1mQswgnRW3emB8Td994xWhvt4NagEFEPOqn3EMuR/d/gFZfj3V+93bi
	eED9kXv1mIJnWcDVZogxfBcHXC5kK7qIU94QvssXW/thYE89X1GgP7sGZ7haXwPrI/da0gbdZ/9
	tFAdexwcWN6vGpjN+BYAmzVfjLhC0Ngkcrmu8ixGUXIJ5XvemaSQt5y4Dz6YDglFru+zedm8Hbb
	fb/QfQHYi/+KmiS0CWu/6Wc97ejyWhzsPeDVreYIp4uLPri5QT2Se8Nyj7EpJB1+tbm9bbARSZ5
	kfVH88MOsJIyAt+kpkYNrNX+YrCdxiqpVQyE=
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id
 5a478bee46e88-3857111f203mr32029115eec.35.1795842256924; Fri, 27 Nov 2026
 21:04:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Henry Zhang <henryzhang62@gmail.com>
Date: Fri, 27 Nov 2026 21:04:06 -0800
X-Gm-Features: Aa3M54pVvds-jmLO6mxXdGpcGHxdZ2l9Fkh6Dz6YWyJMQs1TTPKg3dgDtxduVG8
Message-ID: <CANTW0ypcrw2+BAqVKWQ6BOY2eUDK+D47aXuO1zuwZ1VaYwyvVw@mail.gmail.com>
Subject: [STABLE REQUEST] wifi: ath11k: signal strength fixes for 6.6.y and 6.1.y
To: stable@vger.kernel.org
Cc: jjohnson@kernel.org, quic_lingbok@quicinc.com, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_210418_576704_77E46133 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Please consider these two mainline commits for 6.6.y and 6.1.y:

  94f228ac4f5b ("wifi: ath11k: fix ack signal strength calculation")
  aadeee47e9d7 ("wifi: ath11k: modify the calculation of the average
                 signal strength in station mode")

Both are in mainline since v6.11 and in 6.12.y, but not in 6.6.y or
6.1.y, which still add ATH11K_DEFAULT_NOISE_FLOOR to the ack signal and
to the average signal unconditionally.

On firmware that reports the signal as a signed dBm byte
(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT), these paths treat that
byte as unsigned and still add the -95 dB noise floor, so
"iw dev <wlan> station dump" reports impossible positive values while
"signal" itself is right. Seen on a QCA6390 (fw 0x101c06cc) with an
Ubuntu 6.8 kernel, which has the same affected calculations as 6.6.y:

    signal:          -47 [-50, -51] dBm
    signal avg:      109 dBm
    last ack signal: 103 dBm
    avg ack signal:  47 dBm

109 is 204 - 95, where 204 (0xcc) is -52 dBm, and 103 is 198 - 95,
where 198 (0xc6) is -58 dBm. Userspace that reads these values over
nl80211 gets wrong numbers. No connectivity problem was seen.

The average signal code was added by b205ce4c266c ("ath11k: support
avg signal in station dump"), so 5.15.y does not have that part; I
have not checked 5.15.y for the ack signal part.

- 6.6.y: both commits apply as-is.
- 6.1.y: aadeee47e9d7 applies as-is. 94f228ac4f5b conflicts only in
  the Copyright line of dp_tx.h; I can send a backport without that
  line if that helps.

Testing: upstream, 94f228ac4f5b was tested on WCN6855 and QCN9074, and
aadeee47e9d7 on WCN6855. I applied both to the Ubuntu 6.8.0-138 ath11k
sources and built the modules against the 6.8.0-138 headers without
warnings (BTF generation was skipped, as vmlinux was not available).
I have not run them on the QCA6390, and I have not built 6.6.y or
6.1.y with them.

Thanks,
Henry Zhang

