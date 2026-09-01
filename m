Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADBCC61DD3
	for <ath11k@archiver.kernel.org>; Tue,  1 Sep 2026 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R2B4UIn9uyXdoZMfmtsPZpaGxOVNwVD5ZuxHGzJeSs=; b=HkJ0jM30Vdr4ayQQi7OMW08KJ4
	+xNzz1PINg0gCD7NK6anRRYuAko/oUoasYv74IJSEyQdYBqPge/g2Fs8coAX7VJnRn4VYZCu8lvvO
	OA+lttWoKWVsb0NYpYzG85io+lCAMcINSz4oJ6qLhzARhAvakjK9jUoPJ3v59BIE5PovCUDnFGkZN
	1u59esWuwwPh6GRxTALIj4mysRBAZyCsn4Gly8x/dLiq7pGRkUXUffZ+i8hNXnYQ7Y8QzAnMJF3+2
	2+5kYL+2aPmPYiOWOGIhjrYLbi3QR4P3fyPA9IyuVXhS2vTzs3g6Ae5QyN8oGIMBKvYXoiFjcUghu
	5uABME5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1La8-0000000BWms-1dYY;
	Tue, 01 Sep 2026 10:19:08 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1La5-0000000BWly-0Fqc
	for ath11k@lists.infradead.org;
	Tue, 01 Sep 2026 10:19:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2569aa5116so138822166b.0
        for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788257943; x=1788862743; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/R2B4UIn9uyXdoZMfmtsPZpaGxOVNwVD5ZuxHGzJeSs=;
        b=ZytDyAI2ol6QMyWEApTX6mFJQ3z9SQUln94Nj/AMqb+J7THi9ZNU/W9PIIg1of2NI3
         YQaWenS1KvfIR8YJK2CJpGec3eTZG0watPuCXT7BdRTWHfRWJQhS3UKDQz4KFRbzSGlh
         u3kwcQFmbAjUn/hXGc6ZLsE1CrsVUit0nMkQZR9AGdxKqCSzZwsezEuo2itt50v+1/P4
         lFa6li+Wd7fkRWUIHJYHJcCK/CFFPOxVJTaO1d3VL10edIuABfxpoLZORIjTqVvUBV3J
         slRMPlclfrAsOW8mYZ1L8kbIW2wEui6F9zrupJGjexsEzKftT6jiV3lnRiK+4ZH3/tXX
         w73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257943; x=1788862743;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/R2B4UIn9uyXdoZMfmtsPZpaGxOVNwVD5ZuxHGzJeSs=;
        b=FcpaDCHzrgn8nTZUtoi8QNjxtu5PK7Z5d5Xzy9CwXsZ4q0DpClu+z+G5ixlYRV+rgu
         N/T3+yA+tM2FIvV7AqKxiDepApq699IsmJd7rypxnjlyCLziEeHgIFaNDNsQmqrlgARr
         xaTI/5KTGC9UBCKgZ1xndR9OcDiwLYOcWJLVbtH6plUiWKoI42jNi7JKLj6WikljDxM5
         Ul24DGtJ6KFPe+qHQQNPk1mJMhYNO3XvAoFFRybYG2MOELWX6ZvzojoZQ+Y2Y5o/m+oj
         TuwgNGjihan963yF0r+f1gX41RlmTRy9pCbaN9ERNYDJIzQF2llzg3p8pLEyXqdDPeQt
         blIg==
X-Forwarded-Encrypted: i=1; AHgh+RqPsnjQZrKavrCdPKFzbUxwjjr9YiM67vSRuvdVS1zO9c/EILfiAB17a6iYnIHvEJlnj6LBIlg=@lists.infradead.org
X-Gm-Message-State: AFuF++k3+AKQtqwVYanpBYSUbR57lkdwLbNgBmbSYOEPuxqLAocwSzj3
	tRODWROccwF0ilB4Mxgiokdu1rxyFvVDtVF3lrrgywF/qBphAJOgO4NuTSwXuLrtUK0=
X-Gm-Gg: AR+sD11vI2eBY9ogSfYwPqWlgLaLQvRfDJjgUw0U/nUgQ5MeVFGK9kyuEE6u9gf7isb
	N0nUTfLLO5pjcjj3wKITNywBBWGIx5UUoqMIjer/nGMo5iexEuSkzZfr0FHFG0p23K21FNpUkoE
	G/wkFMdbRTpQ29L54v1PE8CUkWsfA1nCweIySAY9SUjrRQVnmBnlF9sTaAJtLN1gtPSQeASE/YM
	+M7Wr3vTGnewLD/OrtS5C990Su0Z3oSK4yjVGC1TcBmmwZpEVaVjw0ZtNKyxIjT1hVshuCYtG8S
	KBI+VpqDxsBkb5HZp2M3t1EIjGWfwoHqZohYOAGstgWMPjMmv/8Js19lbAO0xrJ36hyBF37gbQR
	RLSj5oH5dGtAYfFxSpCzMPmgKvilKol/qhM0NEMjxm2P72ysZZREkttoFesNnWWHGqIbaChusDE
	E9fs5LfM7x618CSdb/sBmnADmt8nNZ3hFwDgf9cGDIlk8hD/GORLSPhzdfxdwkzoLqJdUuVZnoG
	BrtWhlUvAYLrEK5CE3qToSbQGORDH/8lw==
X-Received: by 2002:a17:907:3cc4:b0:c16:6dac:a008 with SMTP id a640c23a62f3a-c25b919fe0emr274723666b.8.1788257942589;
        Tue, 01 Sep 2026 03:19:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b388sm549393466b.5.2026.09.01.03.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:19:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 12:19:01 +0200
Message-Id: <DL3WJ9AX6P5Y.QS2RPHUIJWVL@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone
 (Gen. 6)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alexander Koskovich" <AKoskovich@pm.me>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <178820768635.1699313.4119708799289566517.b4-ty@kernel.org>
In-Reply-To: <178820768635.1699313.4119708799289566517.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_031905_115735_F26624DD 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi Bjorn,

On Mon Aug 31, 2026 at 10:21 PM CEST, Bjorn Andersson wrote:
>
> On Fri, 03 Apr 2026 15:52:46 +0200, Luca Weiss wrote:
>> Add the required bits to enable Bluetooth and WiFi on the Milos
>> SoC-based Fairphone (Gen. 6) smartphone.
>>=20
>>=20
>
> Applied, thanks!
>
> [3/7] dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
>       commit: e506d34e57236c41cebacc43e50f35f5b52dc675

Mostly checking in, are you planning to pick up the rest of the patches
from this series as well? PATCH 1/7 (PMU dt-bindings) have been picked
up already, and the bluetooth dt-bindings patch has an Acked-by since
June sou you can also pick that up as far as I understand it. Then only
dts is remaining which still appears to apply fine on latest -next.

Shall I resend, or can you pick them up from this v2?

Regards
Luca

>
> Best regards,


