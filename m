Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7037CE9410B
	for <ath11k@archiver.kernel.org>; Tue, 30 Dec 2025 03:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR1YrefQR5kgHzYShT/CgpB0E+LBEbnjiCncyOZA47M=; b=OGOpEpGWan4Y2wMxtplJl6XXPV
	IsXt6HGrXExWlgKNrJwmWONre3E5FE4tWDdZZg4EZfaYH6YOaXlojwr76YXYkeT58j2X2ZWa7iggN
	OgaQ22kTmrCl6BnIBdKARqKLtzKAy+uxRD8Cu7KCf6wHXlEJJiIxFSaTFbMrelUeNeYSlaez8Buh2
	oszQUQ07PGz/J29Or/lhJpTMeRLZVtP17S886LejZb6gBxLQE3qQiIBrBznZS/9cVGByTehid5GnG
	aMN3K9t4Kdh6B6acOjUqwfkoJw+unLw0y+mkhZjhWAggEbA9dY6ym6VyqqdUff0ic5H8+NNWEZhYd
	YnCpVUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQFg-00000004MEY-2wd4;
	Tue, 30 Dec 2025 03:18:28 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQFd-00000004MDE-2iIr
	for ath11k@lists.infradead.org;
	Tue, 30 Dec 2025 03:18:27 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EF9EC1400151;
	Mon, 29 Dec 2025 22:18:21 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 29 Dec 2025 22:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767064701;
	 x=1767151101; bh=BR1YrefQR5kgHzYShT/CgpB0E+LBEbnjiCncyOZA47M=; b=
	FDfDnu9jTO3X2brkk8lhF3Id/I6QvwQyZNXyhPISm5QyD0UpRI7ThNO/lk2fvsSb
	m3infpJECQxrmgB0rCdCq0evzbxipla5m81zOBtkVndOqJBpk4FO4S5L/xg3znav
	qWeBoDiReUjNalaYvszbuuC+9NISUHB4oR+V+h6Ajblf7DnMdGa99CWzfmkzBISe
	VlWsNslQp6ZCcf+ru7XkM2O8sdPYUZWw8dRkYvO9lhJjz7sieoWcqp6rq4yYHWKF
	MzpALqCi83H/UYyGoJaAbQBdH7rX/TbJb0i9HButgY3ObfgLZNcipfbzhiib/VCG
	ejpJ2LEBRJ6xpZoRC8vKUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767064701; x=
	1767151101; bh=BR1YrefQR5kgHzYShT/CgpB0E+LBEbnjiCncyOZA47M=; b=s
	O9lmVs0vfk9TxwTzUNP7/sTYZJGJJ4pHS8cKAe+V0e9NMLcOoyIkQ85l9QNWIDN+
	PoWlUrSDdfFdbn11+bR7SEpOgeceHAFYd0awJWpOz9pUhhdkZxy8UaSYtw6awZKK
	QkbX8MBM6QffawYJgkVxoQ9tl2FeTnk5Bzrd34B67rv8Borb/zXmiauUPCA/J9z4
	FEQ4MqNbrHZ9fUyUQugZ7OIphLmBkdQOcWCuM4zewEuH0QWl/HZJBBoPgeAf65/A
	5RMrqU3h1QQbK6e7JDL+f6+zHyoEwx4kQDNgcWhF7hn2Cez5eLOcCY0YcfJrLetU
	Uwc18hfH1+JbVK8QSdBVg==
X-ME-Sender: <xms:fURTaV3rdfR562o3m_OGW5SwvrnGVJvxHlyZfr4_5eOjZqu8DhL6Ug>
    <xme:fURTaW6Y9YKPCVxRq3aoS_fcrHbinrImTHyj8wcaKxsneLNiPMQz66H5wzpwDIaHk
    bZjbfND5Bc_SpA29dk6GrL7lENvzuHYejiyZKj3VtHdWLLkgrjPgpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejkeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhepudelieegffefvdfghfevvdegtdetveekkefggfffteef
    heffvdefgfeufeekudefnecuffhomhgrihhnpehlvghnohhvohdrtghomhdpkhgvrhhnvg
    hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpth
    htohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoshhssehkrghllhhi
    shhtihdruhhspdhrtghpthhtohepjhhjohhhnhhsohhnsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrthhhuddukheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fURTae_zsJmckAJDxKSKsfzr9WxyFGyPaZU-SndrKB93LrDr_lB_DA>
    <xmx:fURTaaLkaty8Qbniu542Bx4DloM9GJecd5dSRgoMoRuEJCoCTh1V0Q>
    <xmx:fURTaXj4L6xVxKZc-TRecJNVJsSQCNLEgS1MAiiG95Xz4uZXzb6AwQ>
    <xmx:fURTaa6BdaM4zh1FY7ovN5wRoIVQL3YrBG89Eyx4-Op3Mc1Tbgwalg>
    <xmx:fURTaQCXoTv-BU5GO1Z-hUy3AuJRYShiw-0Gztg5mrtkzEDzZso8tFf9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B89022CE0072; Mon, 29 Dec 2025 22:18:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AczW8cjZh48J
Date: Mon, 29 Dec 2025 22:18:01 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Ross Vandegrift" <ross@kallisti.us>, "Jeff Johnson" <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Message-Id: <56017489-d1cb-4c9d-8550-0ca51dbb847c@app.fastmail.com>
In-Reply-To: <lqdj7qwifphuvho2ag6fi25y63on2lzur7of6yt5prz3rxveur@zofllv7qgf2w>
References: <lqdj7qwifphuvho2ag6fi25y63on2lzur7of6yt5prz3rxveur@zofllv7qgf2w>
Subject: Re: [PATCH] wifi: ath11k: add pm quirk for Thinkpad Z16 Gen1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_191825_753463_D5A92915 
X-CRM114-Status: GOOD (  18.45  )
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

Hi Ross, 

On Mon, Dec 29, 2025, at 1:56 PM, Ross Vandegrift wrote:
> Z16 Gen1 has the wakeup-from-suspend issues from [1] but was never added
> to the appropriate quirk list.  I've tested this patch on top of 6.18.2,
> it fixes the issue for me.
>
> There's normally a second DMI product id, but I don't know what it is.
> I also suspect Z13 Gen1 should be added too.  Mark, do you have those?

It's a bit odd as 21D4/21D5 is the Z16 G1
Z13 G1 should be 21D2/21D3
(https://psref.lenovo.com/WDProduct/ThinkPad/ThinkPad_Z13_Gen_1)

They're both based on the same design and system FW so I'd expect the issue to hit both platforms.

I plan on testing this on my system but haven't done yet. I can check the Z16.

Mark
>
> [1] - https://bugzilla.kernel.org/show_bug.cgi?id=219196
>
> Signed-off-by: Ross Vandegrift <ross@kallisti.us>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
> b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8..1c910db69738 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -994,6 +994,13 @@ static const struct dmi_system_id 
> ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z16 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
> +		},
> +	},
>  	{}
>  };
> 
> -- 
> 2.47.3

